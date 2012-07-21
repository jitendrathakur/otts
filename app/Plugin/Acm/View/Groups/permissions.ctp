<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Groups'); ?></h2>
<fieldset>
	<legend><?php printf(__('View Permissions for %s', true), $group_name); ?></legend>
<?php
// If there are any permissions for group then display them
if (count($group_permissions))
{
?>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<th><?php echo __('Controller/Action'); ?></th>
			<th><?php echo __('Permission'); ?></th>
		</tr>
<?php
	// Loop through group's permissions to display them
	foreach ($group_permissions as $key => $group_permission)
	{
?>
		<tr<?php echo (($key % 2 == 0) ? ' class="altrow"' : ''); ?>>
			<td><?php echo str_replace('::', '/', $group_permission['Aco']['alias']); ?></td>
			<td><?php echo ((0 < $group_permission['Permission']['_create'] && 0 < $group_permission['Permission']['_read'] && 0 < $group_permission['Permission']['_update'] && 0 < $group_permission['Permission']['_delete']) ? __('Allowed', true) : __('Denied', true)); ?></td>
		</tr>
<?php
	}
?>
	</table>
<?php
}
?>
</fieldset>
