<div class="tests index"><?php //debug($tests); ?>
	<h2><?php echo __('Tests');?></h2>
	<table class="table table-striped table-condensed table-bordered">
	<tr>
		<th><?php echo $this->Paginator->sort('id');?></th>
		<th><?php echo $this->Paginator->sort('Topic');?></th>
		<th><?php echo $this->Paginator->sort('Name');?></th>
		<th><?php echo $this->Paginator->sort('code');?></th>
		<th class="actions"><?php echo __('Actions');?></th>
	</tr>
	<?php
	foreach ($tests as $test): ?>
	<tr>		
		<td><?php echo h($test['Test']['id']); ?>&nbsp;</td>
		<td><?php echo h($test['Topic']['name']); ?>&nbsp;</td>
		<td><?php echo !empty($test['Test']['name']) ? $test['Test']['name'] : 'No Name';  ?>&nbsp;</td>
		<td><?php echo h($test['Test']['code']); ?>&nbsp;</td>
		<td class="actions">						
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $test['Test']['id']),  array('class' => 'btn btn-danger btn-mini'), __('Are you sure you want to delete # %s?', $test['Test']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>

	<?php echo $this->element('paging'); ?>
</div>
