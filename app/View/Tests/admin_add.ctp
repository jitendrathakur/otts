<div class="tests form">
	<h2><?php echo __('Create Test'); ?></h2>
<?php echo $this->Form->create('Test', $twitterBootstrapCreateOptions);?>
	<?php
	    echo $this->Form->input('name');
		echo $this->Form->input('number_of_questions');
	?>
<div class="row">
	<div class="span12">
		<?php echo $this->Html->link('Select All Topics', '#', array('class' => 'check-all btn btn-mini btn-primary')) ?>
		<?php echo $this->Html->link('Unselect All Topics', '#', array('class' => 'uncheck-all btn-mini btn btn-info')) ?>
	</div>	
</div>
<br />
<div class="tabbable tabs-left">
	<ul class="nav nav-tabs">
		<?php $count = 1; ?>
		<?php foreach ($topics as $subject => $topic): ?>
			<li class="<?php echo ($count == 1) ? 'active' : '' ; ?>"><?php echo $this->Html->link($subject, '#'.preg_replace("/[^A-Za-z0-9 ]/", '', $subject), array('data-toggle' => 'tab')); ?></li>
			<?php $count++; ?>
		<?php endforeach; ?>
	</ul>
	<div class="tab-content">
		<?php $count = $topicCount = 1; ?>
		<?php foreach ($topics as $subject => $topic): ?>
			<div class="tab-pane <?php echo ($count == 1) ? 'active' : '' ; ?>" id="<?php echo preg_replace("/[^A-Za-z0-9 ]/", '', $subject); ?>">
				<p>
					<ul class="unstyled">
					<?php foreach ($topic as $key => $value) : ?>
						<?php $checkboxOptions = array('value' => $key, 'class' => 'topic_checkbox'); ?>
						<li><?php echo $this->Form->checkbox("Test.topic_id.{$topicCount}", $checkboxOptions); echo "&nbsp; $value" ?><br /></li>
						<?php $topicCount++; ?>
					<?php endforeach; ?>				
					</ul>
				</p>
			</div>
			<?php $count++; ?>
		<?php endforeach; ?>
	</div>
</div>
<?php echo $this->Form->end($twitterBootstrapEndOptions);?>
</div>
<?php echo $this->element('sidebar'); ?>
<?php echo $this->Html->script(array('Test/admin_add'), array('inline' => false)) ?>
