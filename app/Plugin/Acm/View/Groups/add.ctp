<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('Groups'); ?></h2>
<?php echo $this->Form->create('Aro', array('url' => array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'add'))); ?>
<fieldset>
	<legend><?php __('Add Group'); ?></legend>
	<?php echo $this->Form->input('parent_id', array('empty' => true, 'label' => __('Parent Group', true), 'options' => $groups)); ?>
	<?php echo $this->Form->input('alias', array('error' => array('invalid' => __('Group name must not be empty and can contain alphabets, numbers and/or spaces', true), 'duplicate' => __('The chosen group name already exists. Please try another', true)), 'label' => __('Group Name', true))); ?>
</fieldset>
<?php echo $this->Form->end(__('Add Group', true)); ?>
