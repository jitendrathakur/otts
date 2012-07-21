<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Users'); ?></h2>
<table cellpadding="0" cellspacing="0">
	<tr>
		<th><?php echo __('Name'); ?></th>
		<th><?php echo __('Group(s)'); ?></th>
		<th><?php echo __('Actions'); ?></th>
	</tr>
<?php
// Loop through list of users
foreach ($users as $key => $user)
{
	// Store user id in variable to use it later
	$user_id = $user[$user_model_name]['id'];
?>
	<tr<?php echo (($key % 2 == 0) ? ' class="altrow"' : ''); ?>>
		<td><?php echo $user[$user_model_name]['email']; ?></td>
		<td><?php echo (count($user['Group']) ? implode(', ', $user['Group']) : '&nbsp;'); ?></td>
		<td>
			<?php echo $this->Html->link(__('Change Group(s)', true), array('plugin' => 'acm', 'controller' => 'users', 'action' => 'groups', $user_id)); ?> &nbsp;
			<?php echo $this->Html->link(__('View Permissions', true), array('plugin' => 'acm', 'controller' => 'users', 'action' => 'permissions', $user_id)); ?>
		</td>
	</tr>
<?php
}
?>
</table>
