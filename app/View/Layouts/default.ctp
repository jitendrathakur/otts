<!DOCTYPE html>
<html lang="en">
  <head>
    <?php echo $this->Html->charset(); ?>
    <title><?php echo __("{$title_for_layout} | My Exam Preparation"); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <?php echo $this->Html->meta('icon'); ?>

    <!-- Le styles -->
    <?php echo $this->Html->css(array('bootstrap', 'bootstrap.responsive', 'custom')); ?>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <?php echo $this->Html->script(array('jquery-1.7.1.min', 'bootstrap')); ?>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>
    <?php echo $this->element('topbar'); ?>

    <div class="container-fluid">
      <?php 
          echo $this->Session->flash(); 
          echo $this->Session->flash('auth');
          ?>
          <div class="row-fluid">
            <div class="span12">
              <?php echo $content_for_layout; ?>
            </div>
            <!-- <div class="span3 hide">
                <?php  foreach ($advertise as $Advertise): ?>
                    <a href="<?php echo $Advertise['Advertise']['link'] ?>">
                        <img class="thumbnail" src="<?php echo $this->webroot.'files/images/'.$Advertise['Image']['filename']; ?>" alt="" />
                    </a>
                <?php endforeach; ?>
            </div>            -->
          </div>
                    
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php       
      echo $this->Html->scriptBlock('var baseUrl = "'.$this->Html->url('/').'";');
      echo $scripts_for_layout;
      //echo $this->element('sql_dump');
    ?>
  </body>
</html>
