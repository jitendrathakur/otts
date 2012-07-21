<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Groups'); ?></h2>
<?php echo $this->Form->create('Aro', array('url' => array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'users', $id))); ?>
<fieldset>
	<legend><?php __('Manage Group User(s)'); ?></legend>
	<?php echo $this->Form->input('alias', array('disabled' => true, 'label' => __('Group Name', true), 'readonly' => true)); ?>
	<?php echo $this->Form->input('users', array('label' => __('User(s)', true), 'multiple' => 'checkbox', 'options' => $users)); ?>
</fieldset>
<?php echo $this->Form->end(__('Manage Group User(s)', true)); ?>
