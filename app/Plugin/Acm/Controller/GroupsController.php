<?php

/**
 * File used as groups controller
 *
 * Contains actions for groups controller
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */

/**
 * Controller class containing groups controller's actions
 *
 * @author Amit Badkas <amit@sanisoft.com>
 * @package ACM (Access Control Manager)
 * @version 1.0
 */
class GroupsController extends AcmAppController
{
	/**
	 * Property used to store name of controller
	 *
	 * @access public
	 * @var string Name of controller
	 */
	var $name = 'Groups';

	/**
	 * Property used to store name of model used by controller
	 *
	 * @access public
	 * @var string Name of model used by controller
	 */
	var $uses = 'Aro';


	/**
	 * Action method used to display list of groups to manage them
	 *
	 * @access public
	 */
	function index()
	{
		// Get list of all groups ordered by alias
		$groups = $this->Aro->find('all', array('conditions' => 'Aro.foreign_key IS NULL', 'fields' => 'Aro.id, Aro.rght, Aro.alias, Aro.parent_id', 'order' => 'Aro.lft ASC, Aro.alias ASC', 'recursive' => -1));

		// Loop through list of groups to find each group's parent
		foreach ($groups as $key => $group)
		{
			// Store group's parent's id in variable to use it later
			$parent_id = (int)$group['Aro']['parent_id'];

			// If parent id is valid then get its alias
			if (0 < $parent_id)
			{
				$groups[$key]['Parent']['alias'] = $this->Aro->field('Aro.alias', 'Aro.id = ' . $parent_id);
			}

			// Loop through group's users to get each user's name
			foreach ($this->Aro->find('all', array('conditions' => 'Aro.parent_id = ' . $group['Aro']['id'] . ' AND Aro.foreign_key IS NOT NULL', 'fields' => 'Aro.foreign_key', 'recursive' => -1)) as $user)
			{
				$user_id = $user['Aro']['foreign_key'];
				$groups[$key][$this->user_model_name][$user_id] = $this->UserModelObject->field($this->user_model_name . '.email', $this->user_model_name . '.id = ' . $user_id);
				unset($user_id);
			}

			// Sort group's users by their name
			if (isset($groups[$key][$this->user_model_name]))
			{
				asort($groups[$key][$this->user_model_name]);
			}

			// Unset not needed variables
			unset($parent_id);
			unset($group);
		}

		// Set list of groups to use in view
		$this->set(compact('groups'));

		// Unset not needed variable
		unset($groups);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'groups' . DS . 'index.ctp');
	}

	/**
	 * Method used to add new group/sub-group
	 *
	 * @access public
	 * @param integer $parent_id Id of parent group
	 */
	function add($parent_id = null)
	{
		// Type cast parent id as integer
		$parent_id = (int)$parent_id;

		// If form is posted then add group
		if ($this->request->data)
		{
			// Prepare model to add new record
			$this->request->data['Aro']['id'] = 0;
			$this->Aro->create();

			// If data validated and saved successfully then set success message in session and redirect to groups list page
			if ($this->__validateAroData() && $this->Aro->save($this->request->data['Aro']))
			{
				$this->Session->setFlash(__('Group has been added successfully', true));
				$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
			}
			else
			{
				// If data failed to validate or save then set error message in session
				$this->Session->setFlash(__('Unable to add group. Please try again', true));
			}
		}
		else
		{
			// Set needed data when form is not posted
			$this->request->data['Aro']['parent_id'] = $parent_id;
		}

		// Get list of all groups ordered by alias
		$groups = $this->Aro->find('all', array('conditions' => 'Aro.foreign_key IS NULL OR Aro.foreign_key <= 0', 'fields' => 'Aro.id, Aro.alias', 'order' => 'Aro.alias ASC', 'recursive' => -1));

		// If there are any groups then make list
		if (count($groups))
		{
			$groups = Set::combine($groups, '{n}.Aro.id', '{n}.Aro.alias');
		}

		// Set list of groups to use in view
		$this->set(compact('groups'));

		// Unset not needed variable
		unset($groups);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'groups' . DS . 'add.ctp');
	}

	/**
	 * Method used to validate group data while adding/editing it
	 *
	 * @access private
	 */
	function __validateAroData()
	{
		// If group name is empty or contain invalid characters then invalidate it
		if (!eregi('^[a-zA-Z0-9 ]+$', $this->request->data['Aro']['alias']))
		{
			$this->Aro->invalidate('alias', 'invalid');
			return false;
		}
		// If group name is already exists then invalidate it
		else if ($this->Aro->hasAny('Aro.alias = "' . $this->request->data['Aro']['alias'] . '"' . ((isset($this->request->data['Aro']['id']) && $this->request->data['Aro']['id']) ? ' AND Aro.id != ' . $this->request->data['Aro']['id'] : '')))
		{
			$this->Aro->invalidate('alias', 'duplicate');
			return false;
		}

		// By default return true
		return true;
	}

	/**
	 * Action method used to edit group
	 *
	 * @access public
	 * @param integer $id Id of group
	 */
	function edit($id = null)
	{
		// Type cast group id as integer
		$id = (int)$id;

		// If there is no group with given id then set error message in session and redirect to groups list page
		if (!$this->Aro->hasAny('Aro.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid group id', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// Get given group's details using its id
		$group_details = $this->Aro->findById($id, array(), null, -1);

		// If given group is among ACM groups then deny to edit that group
		if (in_array($group_details['Aro']['alias'], $this->acm_groups))
		{
			$this->Session->setFlash(__('You cannot edit built-in group', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// If form is posted then edit group
		if ($this->request->data)
		{
			// Store group id in data
			$this->request->data['Aro']['id'] = $id;

			// If data validated and saved successfully then set success message in session and redirect to groups list page
			if ($this->__validateAroData() && $this->Aro->save($this->request->data['Aro']))
			{
				$this->Session->setFlash(__('Group has been edited successfully', true));
				$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
			}
			else
			{
				// If data failed to validate or save then set error message in session
				$this->Session->setFlash(__('Unable to edit group. Please try again', true));
			}
		}
		else
		{
			// Set needed data when form is not posted
			$this->request->data['Aro'] = $group_details['Aro'];
		}

		// Get list of all groups ordered by alias and make list
		$groups = $this->Aro->find('all', array('conditions' => 'Aro.foreign_key IS NULL OR Aro.foreign_key <= 0', 'fields' => 'Aro.id, Aro.alias', 'order' => 'Aro.alias ASC', 'recursive' => -1));
		$groups = Set::combine($groups, '{n}.Aro.id', '{n}.Aro.alias');

		// Set needed variables to use in view
		$this->set(compact('groups', 'group_details'));

		// Unset not needed variables
		unset($group_details);
		unset($groups);
		unset($id);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'groups' . DS . 'edit.ctp');
	}

	/**
	 * Action method used to delete group
	 *
	 * @access public
	 * @param integer $id Id of group
	 */
	function delete($id = null)
	{
		// Type cast group id as integer
		$id = (int)$id;

		// If there is no group with given id then set error message in session and redirect to groups list page
		if (!$this->Aro->hasAny('Aro.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid group id', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// Get given group's details using its id
		$group_details = $this->Aro->findById($id, array('Aro.alias, Aro.parent_id'), null, -1);

		// If given group is among ACM groups then deny to delete that group
		if (in_array($group_details['Aro']['alias'], $this->acm_groups))
		{
			$this->Session->setFlash(__('You cannot delete built-in group', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// Get given group's parent's id and list of children
		$parent_id = (int)$group_details['Aro']['parent_id'];
		$children = $this->Aro->find('list', array('conditions' => 'Aro.parent_id = ' . $id));

		// Loop through group's children to change each child group's parent id as given group's parent id
		foreach ($children as $key => $value)
		{
			$this->Aro->id = $key;
			$this->Aro->saveField('parent_id', $parent_id);
		}

		// If group deleted successfully then set success message in session
		if ($this->Aro->del($id))
		{
			$this->Session->setFlash(__('Group has been deleted successfully', true));
		}
		// If group failed to delete then proceed further
		else
		{
			// Set error message in session
			$this->Session->setFlash(__('Unable to delete group. Please try again', true));

			// Loop through group's children to change each child group's parent id as given group's id
			foreach ($children as $key => $value)
			{
				$this->Aro->id = $key;
				$this->Aro->saveField('parent_id', $id);
			}
		}

		// Redirect to groups list page
		$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
	}

	/**
	 * Action method used to manage user(s) for group
	 *
	 * @access public
	 * @param integer $id Id of group
	 */
	function users($id = null)
	{
		// Type cast group id as integer
		$id = (int)$id;

		// If there is no group with given id then set error message in session and redirect to groups list page
		if (!$this->Aro->hasAny('Aro.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid group id', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// Get group's users
		$group_users = $this->Aro->find('all', array('conditions' => 'Aro.parent_id = ' . $id . ' AND Aro.foreign_key IS NOT NULL', 'fields' => 'Aro.id, Aro.foreign_key', 'recursive' => -1));

		// If form is posted then change group's user(s)
		if ($this->request->data)
		{
			// Initialize variable to store group's users' IDs
			$aros = (is_array($this->request->data['Aro']['users']) ? $this->request->data['Aro']['users'] : array());

			// Loop through group's users
			foreach ($group_users as $aro)
			{
				// Store foreign key (user id) in variable to use it later
				$user_id = $aro['Aro']['foreign_key'];

				// If current user's foreign key is in posted data then unset it so that it will not get save
				if (in_array($user_id, $aros))
				{
					$keys = array_keys($aros, $user_id);
					unset($aros[$keys[0]]);
					unset($keys);
				}
				else
				{
					// Delete not needed ARO
					$this->Aro->del($aro['Aro']['id']);
				}

				// Unset not needed variables
				unset($user_id);
				unset($aro);
			}

			// Loop through posted AROs
			foreach ($aros as $aro)
			{
				// Build data to save
				$data = array
				(
					'parent_id' => $id
					, 'foreign_key' => $aro
					, 'alias' => $this->user_model_name . '::' . $aro
				);

				// Prepare model to save data
				$this->Aro->create();
				$this->Aro->id = 0;

				// Save needed data
				$this->Aro->save($data);

				// Unset not needed variables
				unset($data);
				unset($aro);
			}

			// Unset not needed variable
			unset($aros);

			// Set success message in session
			$this->Session->setFlash(__('Users successfully chosen for group', true));

			// Redirect to groups list page
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}
		// If there are any users for group then set them in data
		else if (count($group_users))
		{
			$this->request->data['Aro']['users'] = array_values(Set::combine($group_users, '{n}.Aro.id', '{n}.Aro.foreign_key'));
		}

		// Get given group's name (ARO's alias) using its id and set it in data
		$this->request->data['Aro']['alias'] = $this->Aro->field('Aro.alias', 'Aro.id = ' . $id);

		// Get list of all users ordered by name
		$users = $this->UserModelObject->find('all', array('fields' => $this->user_model_name . '.id, ' . $this->user_model_name . '.email', 'order' => $this->user_model_name . '.email ASC', 'recursive' => -1));

		// If there are any users then make list
		if (count($users))
		{
			$users = Set::combine($users, '{n}.' . $this->user_model_name . '.id', '{n}.' . $this->user_model_name . '.email');
		}

		// Set needed variables to use in view
		$this->set(compact('id', 'users'));

		// Unset not needed variables
		unset($group_users);
		unset($users);
		unset($id);

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'groups' . DS . 'users.ctp');
	}

	/**
	 * Action method used to view permissions for group
	 *
	 * @access public
	 * @param integer $id Id of group
	 */
	function permissions($id = null)
	{
		// Type cast group id as integer
		$id = (int)$id;

		// If there is no group with given id then set error message in session and redirect to groups list page
		if (!$this->Aro->hasAny('Aro.id = ' . $id))
		{
			$this->Session->setFlash(__('Please provide valid group id', true));
			$this->redirect(array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index'), null, true);
		}

		// Get given group's name using its id and set it in view along with group's permissions
		$this->set('group_name', $this->Aro->field('Aro.alias', 'Aro.id = ' . $id));
		$this->set('group_permissions', $this->Aro->Permission->findAllByAroId($id));

		// Render needed view
		//$this->render(null, null, APP . 'plugins' . DS . 'acm' . DS . 'views' . DS . 'groups' . DS . 'permissions.ctp');
	}
}
