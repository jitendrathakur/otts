<?php

/**
 * File used as ACM plugin's application controller
 *
 * Contains methods common for all controllers in ACM plugin
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */

/**
 * Controller class containing ACM plugin's all controller's common actions
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */
class AcmAppController extends AppController
{
    /**
     * Property used to store list of components used by application's all controller's actions
     *
     * @access public
     * @var string List of components used by application's all controller's actions
     */
    var $components = array('Acl', 'Auth');

    /**
     * Property used to store name of model in which users saved
     *
     * @access public
     * @var string Name of model in which users saved
     */
    var $user_model_name = 'User';

    /**
     * Property used to store object of model in which users saved
     *
     * @access public
     * @var object Object of model in which users saved
     */
    var $UserModelObject;

    /**
     * Property used to store list of needed groups
     *
     * @access public
     * @var string List of needed groups
     */
    var $acm_groups = array('User', 'Admin', 'Anonymous');

    /**
     * Constructor for controller - contains code to store object for model (which is used to store users) in class variable
     *
     * @access public
     */
    function __construct($request = null, $response = null)
    {
        // Call constructor of parent class first
        parent::__construct($request, $response);

        // If object for model (which is used to store users) is in class registry then get it from there
        if (ClassRegistry::isKeySet($this->user_model_name))
        {
            $this->UserModelObject = ClassRegistry::getObject($this->user_model_name);
        }
        // If object for model (which is used to store users) is in not in class registry but imported successfully then create new object
        else if (App::import('Model', $this->user_model_name))
        {
            $this->UserModelObject = new $this->user_model_name;
        }

        // Build needed tables for ACL
        //$this->__buildAclTables();
    }

    /**
     * Method used to build needed tables for ACL
     *
     * @access private
     */
    function __buildAclTables()
    {
        // Get object for mysql database and set cache sources flag to false so that it will not cache non-existent ACL related tables
        $db = ConnectionManager::getDataSource('default');
        $db->cacheSources = false;

        // Get tables list
        $tables = $db->listSources();

        // Initialize ACL related tables list
        $acl_tables = array('acos', 'aros_acos', 'aros');

        // Loop through SQL file which has ACL related tables' create queries to create needed ACL tables
        foreach (explode(';', file_get_contents(CONFIGS . 'sql' . DS . 'db_acl.sql')) as $query)
        {
            foreach ($acl_tables as $key => $table)
            {
                if (!in_array($table, $tables) && false !== strpos($query, 'CREATE TABLE ' . $table . ' '))
                {
                    $db->_execute(trim(str_replace($table, $db->config['prefix'] . $table, $query)));
                }
            }
        }
    }

    /**
     * Method called automatically before executing action - contains code to handle authentication
     *
     * @access public
     */
    function beforeFilter()
    {
        // If ACM is secure is then proceed further to set authentication options
        if ($this->_isAcmSecure())
        {
            // Authorization method
            //$this->Auth->authorize = 'controller';
            $this->Auth->authorize = array(
                                      AuthComponent::ALL => array('actionPath' => 'controllers/'),
                                      'Controller',
                                     );

            // Login page
            $this->Auth->loginAction = array
            (
                'admin' => false
                , 'plugin' => null
                , 'action' => 'login'
                , 'controller' => Inflector::tableize($this->user_model_name)
            );
        }
        // Disable auth component so that controller's 'isAuthorized' method will NOT be called by auth component's startup()
        else
        {
            $this->Auth->enabled = false;
        }
    }

    /**
     * Method called automatically before rendering view - contains code to set name of model (in which users saved) to use in view
     *
     * @access public
     */
    function beforeRender()
    {
        // Set name of model (in which users saved) to use in view
        $this->set('user_model_name', $this->user_model_name);

        // Set list of needed groups to use in view
        $this->set('acm_groups', $this->acm_groups);
    }

    /**
     * Action method used to build ACOs list
     *
     * @access protected
     */
    function _buildAcos()
    {
        // Build conditions to get grand parent ACO's id
        $grand_parent_conditions = array('alias' => 'ALL');

        // If needed root ACO already exists then get its id otherwise create it and get its id
        if (!$grand_parent_id = (int)$this->Acl->Aco->field('Aco.id', $grand_parent_conditions))
        {
            $this->Acl->Aco->create();
            $this->Acl->Aco->save($grand_parent_conditions);
            $grand_parent_id = (int)$this->Acl->Aco->getLastInsertID();
        }

        // Build conditions to get ACM ACO's id
        $acm_conditions = array('alias' => 'Acm');

        // If needed ACM ACO already exists then get its id otherwise create it and get its id
        if (!$acm_id = (int)$this->Acl->Aco->field('Aco.id', $acm_conditions))
        {
            $this->Acl->Aco->create();
            $this->Acl->Aco->save(am($acm_conditions, array('parent_id' => $grand_parent_id)));
            $acm_id = (int)$this->Acl->Aco->getLastInsertID();
        }

        // Initialize variable used to store list of ACOs
        $acos = array
        (
            $grand_parent_id => 'ALL'
            , $acm_id => 'Acm'
        );

        // Get list of methods for application controller
        $app_methods = get_class_methods('AppController');

        // Get list of controllers and then sort it alphabetically
        //$controllers = Configure::listObjects('controller');
        $controllers = App::objects('Controller');
        sort($controllers);

        // Loop through list of controllers to get each controller's methods
        foreach ($controllers as $key => $controller)
        {
            $controller = substr($controller, 0, (strlen($controller) - strlen("Controller")));
            // We don't need methods for application controller
            if ('App' == $controller)
            {
                continue;
            }

            // Get ACO id for controller and build ACOs data as per our need
            $controller_aco_id = $this->__getAcoId($controller, $grand_parent_id);
            $acos[$controller_aco_id] = $controller;

            // Include controller's class file
            App::import('Controller', $controller);

            // Get controller's methods and sort them alphabetically
            $controller_methods = array_diff(get_class_methods($controller . 'Controller'), $app_methods);
            sort($controller_methods);

            // Loop through controller's method to store each public method as ACO
            foreach ($controller_methods as $controller_method)
            {
                // We need only public methods
                if ('_' != substr($controller_method, 0, 1))
                {
                    $acos[$this->__getAcoId($controller . '::' . $controller_method, $controller_aco_id)] = $controller . '/' . $controller_method;
                }
            }
        }

        // Delete not needed ACOs from database table
        $this->Acl->Aco->deleteAll('Aco.id NOT IN (' . implode(', ', array_keys($acos)) . ')');

        // Return built ACOs
        return $acos;
    }

    /**
     * Method used to get ACO id for alias (if not found then insert record for alias)
     *
     * @access private
     * @param string $alias Alias for ACO
     * @param integer $parent_id Id for ACO's parent
     */
    function __getAcoId($alias, $parent_id)
    {
        // Build conditions to get ACO id for given alias and parent id
        $aco_conditions = array
        (
            'alias' => $alias
            , 'parent_id' => $parent_id
        );

        // If ACO id for given alias and parent id exists already then get it otherwise create new one and get its id
        if (!$aco_id = (int)$this->Acl->Aco->field('Aco.id', $aco_conditions))
        {
            // Save needed ACO
            $this->Acl->Aco->create();
            $this->Acl->Aco->save($aco_conditions);
            $aco_id = (int)$this->Acl->Aco->getLastInsertID();
        }

        // Return ACO id
        return $aco_id;
    }

    /**
     * Method used to test if ACM plugin is secure or not
     *
     * @access protected
     * @return boolean If ACM plugin is secured then return true otherwise return false
     */
    function _isAcmSecure()
    {
        // Id for 'Acm' ACO
        $aco_id = (int)$this->Acl->Aco->field('Aco.id', array('Aco.alias' => 'Acm'));

        // Return flag for ACM is secure or not
        return ($aco_id && $this->Acl->Aco->Permission->hasAny(compact('aco_id')));
    }

    /**
     * Method used to check if user is allowed to access current action or not, this method is called by auth component's startup() method automatically and contains code to check access using ACL
     *
     * @return boolean If user is allowed to access current controller/action then return true or return false
     */
    function isAuthorized()
    {
        // Build ARO alias using logged in user's id
        $aroAlias = 'User::' . (int)$this->Auth->user('id');

        // If ARO does not exist for logged in user then return false
        if (!$this->Acl->Aro->hasAny(array('Aro.alias' => $aroAlias))) {
            return false;
        }

        // Return true/false according to logged in user's access to ACM
        return $this->Acl->check($aroAlias, 'Acm');
    }
}