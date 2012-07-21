<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo __('ACM Plugin:'); ?>
		<?php echo $title_for_layout; ?>
	</title>
<?php
// Output stylesheet include tag
echo $this->Html->css('cake.generic');

// Output scripts include tags (if any)
echo $scripts_for_layout;
?>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1><?php echo $this->Html->link(__('ACM Plugin', true), array('plugin' => 'acm', 'controller' => 'acm', 'action' => 'index')); ?></h1>
		</div>
		<div id="content">
<?php
// Output flash message saved in session
echo $this->Session->flash();

// Output content for page
echo $content_for_layout;
?>

		</div>
	</div>
	<?php echo $this->element('sql_dump'); ?>
</body>
</html>
