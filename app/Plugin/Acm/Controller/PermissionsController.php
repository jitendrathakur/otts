<?php

/**
 * File used as permissions controller
 *
 * Contains actions for permissions controller
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */

/**
 * Controller class containing permissions controller's actions
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */
class PermissionsController extends AcmAppController
{
    /**
     * Property used to store name of controller
     *
     * @access public
     * @var string Name of controller
     */
    var $name = 'Permissions';

    /**
     * Action method used to display list of permissions to manage them
     *
     * @access public
     */
    function index()
    {
        // If form is submitted
        if ($this->request->data && ((isset($this->request->data['Permission']['aro_id']) && 0 < (int)$this->request->data['Permission']['aro_id']) || (isset($this->request->data['Permission']['foreign_key']) && 0 < (int)$this->request->data['Permission']['foreign_key'])) && 0 < (int)$this->request->data['Permission']['aco_id'] && in_array($this->request->data['Permission']['permission'], array('allow', 'deny')))
        {
            // Build ACO id, permission and ACO alias
            $aco_id = (int)$this->request->data['Permission']['aco_id'];
            $permission = $this->request->data['Permission']['permission'];
            $aco_alias = $this->Permission->Aco->field('Aco.alias', 'Aco.id = ' . $aco_id);

            // If we need to control access for group
            if (isset($this->request->data['Permission']['aro_id']))
            {
                $this->Acl->$permission($this->Permission->Aro->field('Aro.alias', 'Aro.id = ' . (int)$this->request->data['Permission']['aro_id']), $aco_alias);
            }
            // If we need to control access for user
            else if (isset($this->request->data['Permission']['foreign_key']))
            {
                // Change permission value as per need
                $permission = (('allow' == $permission) ? 1 : -1);

                // Loop through user's AROs
                foreach ($this->Permission->Aro->find('all', array('conditions' => 'Aro.foreign_key = ' . (int)$this->request->data['Permission']['foreign_key'], 'fields' => 'Aro.id')) as $aro)
                {
                    // Store aro id to use later
                    $aro_id = (int)$aro['Aro']['id'];

                    // Remove current ARO's relationship with given ACO
                    $this->Permission->deleteAll('Permission.aro_id = ' . $aro_id . ' AND Permission.aco_id = ' . $aco_id);

                    // Create new permission
                    $this->Permission->create();
                    $this->Permission->save(array('id' => 0, 'aro_id' => $aro_id, 'aco_id' => $aco_id, '_create' => $permission, '_read' => $permission, '_update' => $permission, '_delete' => $permission));
                }
            }

            // Set success message in session
            $this->Session->setFlash(__('Permission has been saved successfully', true));
        }

        // Set needed variables to use in view
        $this->set('acos', $this->_buildAcos());
        $this->set('users', $this->__getUsersList());
        $this->set('groups', $this->Permission->Aro->generateTreeList(array('Aro.foreign_key' => null), null, '{n}.Aro.alias', '&nbsp;&nbsp;', -1));

        // Render needed view
        //$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'permissions' . DS . 'index.ctp');
    }

    /**
     * Method used to get users list
     *
     * @access private
     * @return array List of users
     */
    function __getUsersList()
    {
        // Get list of all users
        $users = $this->Permission->Aro->find('all', array('conditions' => 'Aro.foreign_key IS NOT NULL', 'recursive' => -1));

        // Loop through list of users to get their group(s)
        foreach ($users as $key => $user)
        {
            // Set user's name as 'alias'
            $users[$key]['Aro']['alias'] = $this->UserModelObject->field($this->user_model_name . '.email', $this->user_model_name . '.id = ' . (int)$user['Aro']['foreign_key']);

            // Initialize variable which is used as loop counter
            $loop_counter = 0;

            // Loop through user's groups to get each group's id and alias to store them in needed array
            foreach ($this->Permission->Aro->find('all', array('conditions' => 'Aro.foreign_key = ' . (int)$user['Aro']['foreign_key'], 'fields' => 'Aro.parent_id')) as $aro)
            {
                $users[$key]['Aro']['alias'] .= ($loop_counter ? ', ' : ' (') . $this->Permission->Aro->field('Aro.alias', 'Aro.id = ' . (int)$aro['Aro']['parent_id']);
                $loop_counter++;
            }

            // If any group for user then we need to close bracket
            if ($loop_counter)
            {
                $users[$key]['Aro']['alias'] .= ')';
            }
        }

        // If there are any users then make list
        if (count($users))
        {
            $users = Set::combine($users, '{n}.Aro.foreign_key', '{n}.Aro.alias');
            asort($users);
        }

        // Return users list
        return $users;
    }
}
