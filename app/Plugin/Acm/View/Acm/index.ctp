<?php echo $this->element('acm_navigation'); ?>
<h2><?php echo __('ACM Home'); ?></h2>
<?php printf(__('If you didn\'t set-up ACM plugin yet then %s'), $this->Html->link(__('click here', true), array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'setup'))); ?><br />
<?php printf(__('If you want to initialize/re-initialize ACOs then %s'), $this->Html->link(__('click here', true), array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'build_acos'))); ?><br />
<?php printf(($is_acm_secure ? __('ACM plugin is secure, to remove its security, %s') : __('ACM plugin is not secure, to make it secure, %s')), $this->Html->link(__('click here', true), array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'secure', 0 => (int)!$is_acm_secure))); ?>
