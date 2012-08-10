<div class="Advertises index">
	<h2><?php echo __('Advertises');?></h2>
	<div class="row">		
		<div class="span10">
			<table class="table table-striped table-condensed table-bordered">
				<tr>
						<th><?php echo $this->Paginator->sort('id');?></th>						
						<th><?php echo $this->Paginator->sort('link');?></th>			
						<th>Image</th>
						<th class="actions"><?php echo __('Actions');?></th>
				</tr>
				<?php
				//debug($Advertises);
				foreach ($Advertises as $Advertise): ?>
				<tr>
					<td><?php echo h($Advertise['Advertise']['id']); ?>&nbsp;</td>
					<td>
						<?php echo $this->Html->link($Advertise['Advertise']['link'], $Advertise['Advertise']['link']); ?>
					</td>
					
					<td><?php echo $this->Html->image('/files/images/'.$Advertise['Image']['filename'], array('class' => 'thumbnail')); ?></td>
					<td class="actions">
						<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $Advertise['Advertise']['id']), array('class' => 'btn btn-mini btn-danger'), __('Are you sure you want to delete # %s?', $Advertise['Advertise']['id'])); ?>
					</td>
				</tr>
			<?php endforeach; ?>
				</table>
				<?php echo $this->element('paging'); ?>
		</div>
		
	</div>


</div>

<style>
  .thumbnail {width: 200px; height: 200px;}
</style>