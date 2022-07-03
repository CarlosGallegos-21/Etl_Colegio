<?php
    //establecer el encabezado en json
    header('Content-Type: application/json');
    include("conexion.php");
    //consulta para obtener datos de la tabla
    $query = sprintf("SELECT * FROM datamartcolegio.dim_periodo;");

    //ejecutar la solicitud
    $result = $mysqli->query($query);

    //recorrer los datos devueltos
    $data = array();
    foreach ($result as $row) {
    $data[] = $row;
    }

    //memoria libre asociada con el resultado
    $result->close();

    //close connection
    $mysqli->close();

    //ahora imprime los datos
    print json_encode($data);
?>