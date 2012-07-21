<?php

/**
 * File used as ACM controller
 *
 * Contains actions for ACM controller
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */

/**
 * Controller class containing ACM controller's actions
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */
class AcmController extends AcmAppController
{
    /**
     * Property used to store name of controller
     *
     * @access public
     * @var string Name of controller
     */
    var $name = 'Acm';

    /**
     * Property used to store list of models used by controller
     *
     * @access public
     * @var null We don't need any model for controller
     */
    var $uses = null;

    /**
     * Action method used to render plugin's home page
     *
     * @access public
     */
    function index()
    {
        // Set flag for ACM is secure or not
        $this->set('is_acm_secure', $this->_isAcmSecure());
    }

    /**
     * Action method used to set-up ACM plugin - contains code to create needed groups and grand-parent ACO
     *
     * @access public
     */
    function setup()
    {
        // If needed groups do not exist already then proceed further to create them
        if (!$this->Acl->Aro->hasAny('Aro.alias IN ("' . implode( '", "', $this->acm_groups) . '")'))
        {
            // Make aro model ready to create new record
            $this->Acl->Aro->create();

            // If 'anonymous' group added then add its child group 'user'
            if ($this->Acl->Aro->save(array('alias' => 'Anonymous')))
            {
                // Build data to add 'user' group
                $data = array
                (
                    'alias' => 'User'
                    , 'parent_id' => $this->Acl->Aro->getLastInsertID()
                );

                // Add 'user' group
                $this->Acl->Aro->create();
                $this->Acl->Aro->save($data);
            }

            // Add 'admin' group
            $this->Acl->Aro->create();
            $this->Acl->Aro->save(array('alias' => 'Admin'));
        }

        // Build conditions to get grand parent ACO's id
        $grand_parent_conditions = array('alias' => 'ALL');

        // If needed root ACO does not exist already then proceed further to create it
        if (!$this->Acl->Aco->hasAny($grand_parent_conditions))
        {
            $this->Acl->Aco->create();
            $this->Acl->Aco->save($grand_parent_conditions);
        }

        // Set success message in session and redirect to plugin home page
        $this->Session->setFlash(__('Setup has been completed successfully', true));
        $this->redirect(array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'index'), null, true);
    }

    /**
     * Action method used to build ACOs list
     *
     * @access public
     */
    function build_acos()
    {
        // Build ACOs
        $this->_buildAcos();

        // Set success message in session and redirect to plugin home page
        $this->Session->setFlash(__('ACOs have been built successfully', true));
        $this->redirect(array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'index'), null, true);
    }

    /**
     * Action method used to secure/un-secure ACM plugin
     *
     * @access public
     * @param integer $security Flag to make ACM plugin secure/un-secure
     */
    function secure($security = 1)
    {
        // Typecast security flag as integer
        $security = (int)$security;

        // Get flag if ACM is secure or not
        $is_acm_secure = $this->_isAcmSecure();

        // If ACM is already secure and user wants to secure it then set message
        if ($is_acm_secure && $security)
        {
            $message = __('ACM is already secure', true);
        }
        // If ACM is already not secure and user wants to remove its security then set message
        else if (!$is_acm_secure && !$security)
        {
            $message = __('ACM is already not secure', true);
        }
        // If user wants to secure ACM then proceed further
        else if ($security)
        {
            // Set message according to addition of ACM's security successful or not
            if ($this->Acl->allow('Admin', 'Acm'))
            {
                $message = __('ACM has been secured successfully', true);
            }
            else
            {
                $message = __('Unable to secure ACM. Please try again', true);
            }
        }
        // If user wants to remove ACM's security then proceed further
        else
        {
            // Id for 'Acm' ACO
            $aco_id = (int)$this->Acl->Aco->field('Aco.id', array('Aco.alias' => 'Acm'));

            // Set message according to removal of ACM's security successful or not
            if ($this->Acl->Aco->Permission->deleteAll(compact('aco_id')))
            {
                $message = __('ACM\'s security has been removed successfully', true);
            }
            else
            {
                $message = __('Unable to remove ACM\'s security. Please try again', true);
            }
        }

        // Set success/error message is session
        $this->Session->setFlash($message);

        // Redirect to plugin's home page
        $this->redirect(array('admin' => false, 'plugin' => 'acm', 'controller' => 'acm', 'action' => 'index'));
    }
}
