<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Groups'); ?></h2>
<?php echo $this->Html->link(__('Add Group', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'add')); ?>
<table cellpadding="0" cellspacing="0">
	<tr>
		<th><?php echo __('Name'); ?></th>
		<th><?php echo __('Parent Group'); ?></th>
		<th><?php echo __('User(s)'); ?></th>
		<th><?php echo __('Actions'); ?></th>
	</tr>
<?php
// Initialize variable used to store stack
$stack = array();

// Loop through list of groups
foreach ($groups as $key => $group)
{
	// If there are any element(s) in stack then remove them from end till stack's last element's value is less than current group's right value
	while (count($stack) && ($stack[count($stack) - 1] < $group['Aro']['rght']))
	{
		array_pop($stack);
	}

	// Store group alias and id in variables to use them later
	$group_name = $group['Aro']['alias'];
	$group_id = $group['Aro']['id'];

	// Don't need to display edit/delete links for ACM groups
	$show_edit_delete_links = !in_array($group_name, $acm_groups);

	// Prepend space(s) to group name as per number of level
	$group['Aro']['alias'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;', count($stack)) . $group['Aro']['alias'];
?>
	<tr<?php echo (($key % 2 == 0) ? ' class="altrow"' : ''); ?>>
		<td><?php echo $group['Aro']['alias']; ?></td>
		<td><?php echo (isset($group['Parent']) ? $group['Parent']['alias'] : '&nbsp;'); ?></td>
		<td><?php echo (isset($group[$user_model_name]) ? implode(', ', $group[$user_model_name]) : '&nbsp;'); ?></td>
		<td>
			<?php echo $this->Html->link(__('Add Sub-group', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'add', $group_id)); ?> &nbsp;
			<?php echo $this->Html->link(__('Manage Group Users', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'users', $group_id)); ?> &nbsp;
			<?php echo $this->Html->link(__('View Permissions', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'permissions', $group_id)); ?> &nbsp;
<?php
// Don't need to display edit/delete links for ACM groups
if ($show_edit_delete_links)
{
	echo $this->Html->link(__('Edit', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'edit', $group_id));
	echo ' &nbsp; ';
	echo $this->Html->link(__('Delete', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'delete', $group_id), null, __('Are you sure you want to delete this group?', true));
}
?>
		</td>
	</tr>
<?php
	// Store current group's right value in stack
	$stack[] = $group['Aro']['rght'];
}
?>
</table>
