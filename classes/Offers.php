<?php
namespace classes;

include_once "autoloader.php";

//use Model;

class Offers extends Model
{
    protected array $_columns = array();

    public function __construct()
    {
        parent::__construct();
        $columns = $this->loadORM($this);
    }
}