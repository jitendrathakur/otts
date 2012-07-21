<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Users'); ?></h2>
<?php echo $this->Form->create($user_model_name, array('url' => array('plugin' => 'acm', 'controller' => 'users', 'action' => 'groups', $id))); ?>
<fieldset>
	<legend><?php echo __('Change Group(s)'); ?></legend>
	<?php echo $this->Form->input('username', array('disabled' => true, 'readonly' => true)); ?>
	<?php echo $this->Form->input('groups', array('label' => __('Group(s)', true), 'multiple' => 'checkbox', 'options' => $groups)); ?>
</fieldset>
<?php echo $this->Form->end(__('Change Group(s)', true)); ?>
