<?php






spl_autoload_register('autoloader');

function autoloader($className)
{
    /////$paths = ["controllers", "models", "config"];
    //$extension = ".php";
    /////foreach ($paths as $path) {
        /////$fullPath = $path."\\".$className . $extension;
        //$fullPath = $className . $extension;
        /////$classPathBase = "%s\%s";
//        $classPathBase = $path."\%s";
//        $fullPath = sprintf(
//            $classPathBase,
//            $className . $extension
//        );

        //if (file_exists($_SERVER['DOCUMENT_ROOT'].'\\testDev\\'.$fullPath)) {
            //die($fullPath);//////////////////
            /////include_once $fullPath;
            //include_once $path;
        //}

    // Try loading the file assuming the file path matches the namespace
    $namespaces = explode('\\', $className);
    $class = array_pop($namespaces);
    $fileName = __DIR__ . '/' . implode('/', $namespaces) . '/' . $class . '.php';
    if(file_exists($fileName)) {
        /////die($class.' EXISTS');///////
        include_once($fileName);
    }
}




