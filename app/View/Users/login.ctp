<div class="row-fluid">
<?php echo $this->Session->flash('auth'); ?>
<div  class="span6">
	<h2>Login</h2>
	<?php echo $this->Form->create('User', $twitterBootstrapCreateOptions);?>
		   
	<?php
	    echo $this->Form->input('username');
	    echo $this->Form->input('password');
	?>
	<?php echo $this->Form->submit('Login', $twitterBootstrapEndOptions);?>
	<?php echo $this->Form->end();?>	  
</div>
<div class="span6">
  <?php  
  $twitterBootstrapCreateOptions['class'] = 'form-horizontal well';
  $twitterBootstrapCreateOptions['action'] = 'signup';
  echo $this->Form->create('User', $twitterBootstrapCreateOptions);
  ?>
    <h2><?php echo __('Sign Up'); ?></h2>
    <?php
    echo $this->Form->input('email', array(
      'label' => array(
        'class' => 'control-label', 
        'text' => 'Email'
        ),
      'error' => array(
        'notempty' => __('Please enter email address'),         
        'email' => __('Please enter valid email address'),         
        'unique' => __('This email address already exist'),         
        ),
      'div'
      )
    );
    echo $this->Form->input('username', array(
      'label' => array(
        'class' => 'control-label', 
        'text' => 'Username'
        ),
      'error' => array(
        'notempty' => __('Please enter user name'),                          
        'unique' => __('This user name already exist'),         
        )
      )
    );
    echo $this->Form->input('password', array(
      'label' => array(
        'class' => 'control-label', 
        'text' => 'Password'
        ),
      'error' => array(
        'required' => __('Please enter password'),
        )
      )
    );
    echo $this->Form->input('password2', array(
      'label' => array(
        'class' => 'control-label', 
        'text' => 'Confirm password'
        ),
      'type' => 'password',
      'error' => array(
        'required' => __('Please confirm your password'),
        'confirm' => __('password could not matched'),
        )
      )
    );
    ?>
    <div class="form-actions">
    <?php 
    echo $this->Form->submit('Submit', array('class' => 'btn btn-primary', 'div' => false)).'&nbsp;&nbsp; ';   
    ?>
    </div>
    <?php
    echo $this->Form->end();
    ?> 
</div>
</div>