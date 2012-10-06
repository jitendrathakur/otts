<div id="questionEdit" class="questions form">
<?php echo $this->Form->create('Question', array_merge($twitterBootstrapCreateOptions, array('type' => 'file')));?>
		<h2><?php echo __('Upload Questions'); ?></h2>
    <?php
    echo $this->Form->input('id', array('type' => 'hidden'));
		echo $this->Form->input('topic_id', array('empty' => true));


    $mode = Configure::read('mode');

    echo $this->Form->input('mode', array('options' => $mode));
    		
      echo $this->Form->input(
          'Image.filename',
          array(
           'type' => 'file',
           'label' => array('text' => 'Question Image', 'class' =>'control-label'),
          )
      );      
      echo $this->Form->end(array_merge($twitterBootstrapEndOptions, array('label' => 'Submit Question Image')));     
     ?>

    

</div>
<?php echo $this->element('sidebar'); ?>
<style>
  .thumbnail {width: 200px; height: 200px;}
</style>