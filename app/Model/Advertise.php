<?php

class Advertise extends AppModel
{

    public $hasOne = array('Image' => array('dependent' => true));
    
}//end class
