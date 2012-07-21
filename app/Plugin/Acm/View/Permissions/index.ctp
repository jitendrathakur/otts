<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Permissions'); ?></h2>
<?php
// Add extra first option for groups and ACOs
$groups = array(0 => __('[Choose group]', true)) + $groups;
$acos = array(0 => __('[Choose controller/action]', true)) + $acos;

// Build permission options
$permissions = array('' => ' -- ', 'allow' => __('Allow', true), 'deny' => __('Deny', true));

// Output form start tag
echo $this->Form->create('Permission', array('url' => array('plugin' => 'acm', 'controller' => 'permissions', 'action' => 'index')));
?>
<fieldset>
	<legend><?php __('Manage Permissions for Groups'); ?></legend>
	<?php echo $this->Form->input('aro_id', array('div' => false, 'escape' => false, 'label' => false, 'options' => $groups)); ?> &nbsp;
	<?php echo $this->Form->input('aco_id', array('div' => false, 'label' => false, 'options' => $acos)); ?> &nbsp;
	<?php echo $this->Form->input('permission', array('div' => false, 'label' => false, 'options' => $permissions)); ?> &nbsp;
	<?php echo $this->Form->submit(__('Save Permission', true), array('div' => false)); ?>
</fieldset>
<?php
// Output form start tag
echo $this->Form->end();

// Add extra first option for users
$users = array(0 => __('[Choose user]', true)) + $users;

// Output form start tag
echo $this->Form->create('Permission', array('url' => array('plugin' => 'acm', 'controller' => 'permissions', 'action' => 'index')));
?>
<fieldset>
	<legend><?php __('Manage Permissions for Users'); ?></legend>
	<?php echo $this->Form->input('foreign_key', array('div' => false, 'label' => false, 'options' => $users)); ?> &nbsp;
	<?php echo $this->Form->input('aco_id', array('div' => false, 'label' => false, 'options' => $acos)); ?> &nbsp;
	<?php echo $this->Form->input('permission', array('div' => false, 'label' => false, 'options' => $permissions)); ?> &nbsp;
	<?php echo $this->Form->submit(__('Save Permission', true), array('div' => false)); ?>
</fieldset>
<?php echo $this->Form->end(); ?>
