<?php

/**
 * File used as users controller
 *
 * Contains actions for users controller
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */

/**
 * Controller class containing users controller's actions
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */
class UsersController extends AcmAppController
{
	/**
	 * Property used to store name of controller
	 *
	 * @access public
	 * @var string Name of controller
	 */
	var $name = 'Users';

	/**
	 * Action method used to display list of users to manage them
	 *
	 * @access public
	 */
	function index()
	{
		// Get list of all users ordered by name
		$users = $this->UserModelObject->find('all', array('fields' => $this->user_model_name . '.id, ' . $this->user_model_name . '.email', 'order' => $this->user_model_name . '.email ASC', 'recursive' => -1));

		// Loop through list of users to find each user's group
		foreach ($users as $key => $user)
		{
			// Initialize variable which is used to list of groups for user
			$users[$key]['Group'] = array();

			// Loop through user's groups to get each group's id and alias to store them in needed array
			foreach ($this->Acl->Aro->find('all', array('conditions' => 'Aro.foreign_key = ' . $user[$this->user_model_name]['id'], 'fields' => 'Aro.parent_id')) as $aro)
			{
				$group_id = $aro['Aro']['parent_id'];
				$users[$key]['Group'][$group_id] = $this->Acl->Aro->field('Aro.alias', 'Aro.id = ' . $group_id);
				unset($group_id);
			}

			// Sort user's groups by their name
			asort($users[$key]['Group']);

			// Unset not needed variable
			unset($user);
		}

		// Set list of users to use in view
		$this->set(compact('users'));

		// Unset not needed variable
		unset($users);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'users' . DS . 'index.ctp');
	}

	/**
	 * Action method used to change group(s) for user
	 *
	 * @access public
	 * @param integer $id Id of user
	 */
	function groups($id = null)
	{
		// Type cast user id as integer
		$id = (int)$id;

		// If there is no user with given id then set error message in session and redirect to users list page
		if (!$this->UserModelObject->hasAny($this->user_model_name . '.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid user id', true));
			$this->redirect(array('action' => 'index'), null, true);
		}

		// Get user's groups
		$groups = $this->Acl->Aro->findAllByForeignKey($id, 'Aro.id, Aro.parent_id', null, null, 1, -1);

		// If form is posted then change user's group
		if ($this->request->data)
		{
			// Initialize variable to store user's AROs' IDs
			$aros = (is_array($this->request->data[$this->user_model_name]['groups']) ? $this->request->data[$this->user_model_name]['groups'] : array());

			// Loop through user's groups
			foreach ($groups as $aro)
			{
				// Store parent id in variable to use it later
				$parent_id = $aro['Aro']['parent_id'];

				// If current ARO's parent's id in posted data then unset it so that it will not get save
				if (in_array($parent_id, $aros))
				{
					$keys = array_keys($aros, $parent_id);
					unset($aros[$keys[0]]);
					unset($keys);
				}
				else
				{
					// Delete not needed ARO
					$this->Acl->Aro->del($aro['Aro']['id']);
				}
			}

			// Loop through posted AROs
			foreach ($aros as $aro)
			{
				// Build data to save
				$data = array
				(
					'parent_id' => $aro
					, 'foreign_key' => $id
					, 'alias' => $this->user_model_name . '::' . $id
				);

				// Prepare model to save data
				$this->Acl->Aro->create();
				$this->Acl->Aro->id = 0;

				// Save needed data
				$this->Acl->Aro->save($data);

				// Unset not needed variables
				unset($data);
				unset($aro);
			}

			// Unset not needed variable
			unset($aros);

			// Set success message in session
			$this->Session->setFlash(__('Groups successfully changed for user', true));

			// Redirect to users list page
			$this->redirect(array('action' => 'index'), null, true);
		}
		// If there are any groups for user then set them in data
		else if (count($groups))
		{
			$this->request->data[$this->user_model_name]['groups'] = array_values(Set::combine($groups, '{n}.Aro.id', '{n}.Aro.parent_id'));
		}

		// Get given user's name using its id and set it in data
		$this->request->data[$this->user_model_name]['email'] = $this->UserModelObject->field($this->user_model_name . '.email', $this->user_model_name . '.id = ' . $id);

		// Get list of all groups ordered by alias
		$groups = $this->Acl->Aro->find('all', array('conditions' => 'Aro.foreign_key IS NULL OR Aro.foreign_key <= 0', 'fields' => 'Aro.id, Aro.alias', 'order' => 'Aro.alias ASC', 'recursive' => -1));

		// If there are any groups then make list
		if (count($groups))
		{
			$groups = Set::combine($groups, '{n}.Aro.id', '{n}.Aro.alias');
		}

		// Set needed variables to use in view
		$this->set(compact('id', 'groups'));

		// Unset not needed variables
		unset($groups);
		unset($id);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'users' . DS . 'groups.ctp');
	}

	/**
	 * Action method used to view permissions for user
	 *
	 * @access public
	 * @param integer $id Id of user
	 */
	function permissions($id = null)
	{
		// Type cast user id as integer
		$id = (int)$id;

		// If there is no user with given id then set error message in session and redirect to users list page
		if (!$this->UserModelObject->hasAny($this->user_model_name . '.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid user id', true));
			$this->redirect(array('action' => 'index'), null, true);
		}

		// Get given user's name using its id and set it in view along with user's permissions
		$this->set('user_name', $this->UserModelObject->field($this->user_model_name . '.email', $this->user_model_name . '.id = ' . $id));
		$this->set('user_permissions', $this->Acl->Aro->Permission->findAllByAroId($this->Acl->Aro->field('Aro.id', 'Aro.foreign_key = ' . $id)));

		// Initialize variable which are used to store user's groups and their permissions
		$groups_permissions = array();
		$groups = array();

		// Loop through user's groups to make their list and to build their permissions
		foreach ($this->Acl->Aro->findAllByForeignKey($id, 'Aro.parent_id', null, null, 1, -1) as $aro)
		{
			$aro_id = $aro['Aro']['parent_id'];
			$groups[$aro_id] = $this->Acl->Aro->field('Aro.alias', 'Aro.id = ' . $aro_id);
			$groups_permissions[$aro_id] = $this->Acl->Aro->Permission->findAllByAroId($aro_id);
		}

		// Set groups and their permissions to use in view
		$this->set(compact('groups', 'groups_permissions'));
	}
}
