<div id="AdvertiseEdit" class="Advertises form">
<?php echo $this->Form->create('Advertise', array_merge($twitterBootstrapCreateOptions, array('type' => 'file')));?>
    <h2><?php echo __('Add Advertise'); ?></h2>
    <?php   
        
        echo $this->Form->input(
        'link',
         array(
           'class' => 'input-xlarge',
           'label' => array('text' => 'Advertise', 'class' =>'control-label'),
           'error' => array(
            'notempty' => __('Please enter Advertise', true),
            'class'    => 'help-inline',
          ),
        )
    );
    ?>
     
     <?php 
      
      echo $this->Form->input('Image.image_of', array('value' => 'Advertise', 'type' => 'hidden'));
            
      echo $this->Form->input(
          'Image.filename',
          array(
           'type' => 'file',
           'label' => array('text' => 'Advertise Image', 'class' =>'control-label'),
          )
      );      
      echo $this->Form->end(array_merge($twitterBootstrapEndOptions, array('label' => 'Submit Advertise Image')));     
     ?>

     </div>
<style>
  .thumbnail {width: 200px; height: 200px;}
</style>