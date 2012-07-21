<?php echo $this->Html->script(array('jquery.countdown')); ?>
<script type="text/javascript">

 function setCookie(c_name,value,exdays)
    {
        var exdate=new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
        document.cookie=c_name + "=" + c_value;
    }


    function getCookie(c_name)
    {
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++)
    {
      x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
      y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
      x=x.replace(/^\s+|\s+$/g,"");
      if (x==c_name)
        {
        return unescape(y);
        }
      }
    }



function checkCookie()
{
var username=getCookie("username");
if (username!=null && username!="")
  {
  alert("Welcome again " + username);
  }
else
  {
  username=prompt("Please enter your name:","");
  if (username!=null && username!="")
    {
    setCookie("username",username,365);
    }
  }
}

    
    function timer() {
        //var domElements = document.getElementById("TestUserStudentTestForm"); //storing dom elements
       
        if((typeof getCookie('timing') == "undefined") || (getCookie('timing') == '')) {
            
            var remaningSeconds = 3559;
        } else {
            var d = getCookie('timing'); 
            var temp = d.split(":");        
            var seconds = parseInt(temp[0] * 60) + parseInt(temp[1]);        

            var remaningSeconds = seconds;
        }       //calculating and storing remaining seconds
        $('#timer').countdown({
            
            until: remaningSeconds, compact: true, format: 'M:S',
            onExpiry: function(){
                console.log($('form#TestUserStudentTestForm'));
                alert(remaningSeconds);
                $("#submitName").html("<input type='hidden' value='Submit Test' name='data[submit]' />");
                testf();
                $('form#TestUserStudentTestForm').submit();
         },
        });     //displaying countdown timer
    }
function testf() {
    document.getElementById("TestUserStudentTestForm").submit();
}

    $(function(){

        
        $(".btn").click(function(){
        var submitTime = $("#timer span").text();
      
        setCookie("timing", submitTime);
        });

    });
</script>


 

  <div class="clock"></div>

<div id="questionEdit" class="tests view">
    
    <h2><?php  echo __('Test');?></h2>
    <p><strong>Question <?php echo $this->Session->read('Test.current_question') + 1;?>: </strong><?php echo __($question['Question']['title']); ?></p>
    <?php foreach ($question['Image'] as $image) {        
        if ($image['image_of'] == 'question') {
            echo $this->Html->image('/files/images/'.$image['filename'], array('class' => 'thumbnail'));
        } 
    } ?>
    <?php echo $this->Form->create('TestUser'); ?>
    <body onload="timer()">
                
        <div align ="right">Time Left</div>
        <div id="timer" align ="right"></div>
        <div id="submitName"></div>
    </body>
    
    <?php for ($i=1; $i <= 4; $i++) { ?>
        <p>
            <?php
            echo $this->Form->input('question_id', array('type' => 'hidden', 'value' => $question['Question']['id']));
            echo $i. ' ';
            echo $this->Form->input('Option.'.$i, array('type' => 'checkbox', 'div' => false, 'label' => array('div' => false, 'text' => $question['Question']['option_'.$i]))); 
            foreach ($question['Image'] as $image) {
                if ($image['image_of'] == 'option_'.$i) {
                    echo $this->Html->image('/files/images/'.$image['filename'], array('class' => 'thumbnail'));
                } 
            } 
                //echo __($i .') '. $question['Question']['option_'.$i]);                 
            ?>
        </p>
    <?php } ?>
    <div class="row">
        <?php //echo $this->Form->create(); ?>
        <div class="span4">
            <?php if ($this->Session->read('Test.current_question') > 0): ?>                
                <input type="submit" value="<< Prev" name="btnPrev" class="btn btn-primary" />
            <?php endif; ?>            
            <?php if ($this->Session->read('Test.current_question') <
                            $this->Session->read('Test.question_count') - 1): ?>
                <input type="submit" value="Next >>" name="btnNext" class="btn btn-primary" />
            <?php endif; ?> 
            <?php if ($this->Session->read('Test.current_question') ==
                            $this->Session->read('Test.question_count') - 1): ?>
                <input type="submit" value="Submit Test" name="submit" class="btn btn-success" />
            <?php endif; ?>            
        </div>
        <?php echo $this->Form->end(); ?>
        
    </div>
</div>