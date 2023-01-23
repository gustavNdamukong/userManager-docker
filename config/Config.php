<?php
namespace config;

if(file_exists("../autoloader.php")) {
    include_once "../autoloader.php";
}
else if (file_exists("autoloader.php"))
{
    include_once "autoloader.php";
}



class Config
{

    public function getConfig()
    {
        return [

            /**
            |--------------------------------------------------------------------------
            | DB connection credentials
            |--------------------------------------------------------------------------
            */

            'localDBcredentials' => [
                'username' => 'php_docker',
                'pwd' => 'password',
                'db' => 'housing', # MUST be same as Dockerfile db service
                'host' => 'db',
                'key' => 'takeThisWith@PinchOfSalt'
            ],

            /**
            |--------------------------------------------------------------------------
            | Allow members of the public to register
            |--------------------------------------------------------------------------
             */

            'allow_registration' => true
        ];
    }
}