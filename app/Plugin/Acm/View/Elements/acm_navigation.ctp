<style>
<!--
ul#navigation {
	list-style-type: none;
}

ul#navigation li {
	float: left;
	margin: 2px;
}
//-->
</style>

<ul id="navigation">
	<li><?php echo $this->Html->link(__('Home', true), array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'index')); ?></li>
	<li><?php echo $this->Html->link(__('Users', true), array('plugin' => 'acm', 'controller' => 'users', 'action' => 'index')); ?></li>
	<li><?php echo $this->Html->link(__('Groups', true), array('plugin' => 'acm', 'controller' => 'groups', 'action' => 'index')); ?></li>
	<li><?php echo $this->Html->link(__('Permissions', true), array('plugin' => 'acm', 'controller' => 'permissions', 'action' => 'index')); ?></li>
</ul>
<br style="clear: both;" />