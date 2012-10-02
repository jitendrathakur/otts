<div class="tutorials view">
	<h2><?php echo h($tutorial['Tutorial']['name']); ?></h2>
	<p><emp>Topic: <?php echo $this->Html->link($tutorial['Topic']['name'], array('controller' => 'topics', 'action' => 'view', $tutorial['Topic']['id'])); ?></em></p>
	<div>
		<?php echo $tutorial['Tutorial']['content']; ?>
	</div>
</div>

<?php echo $this->element('sidebar'); ?>
