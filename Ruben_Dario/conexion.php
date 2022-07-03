<?php
    //database
    define('DB_HOST', 'localhost');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', 'mysql123');
    define('DB_NAME', 'datamartcolegio');

    //obtener conexión
    $mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if(!$mysqli){
        die("Connection failed: " . $mysqli->error);
    }
?>