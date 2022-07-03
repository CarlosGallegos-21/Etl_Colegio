<?php
    //establecer el encabezado en json
    header('Content-Type: application/json');
    include("conexion.php");
    //consulta para obtener datos de la tabla
    $query = sprintf("SELECT
                        SUM(hec_desercioncurso.`suma_desercion`) AS Total
                    FROM
                        `dim_curso` dim_curso INNER JOIN `hec_desercioncurso` hec_desercioncurso ON dim_curso.`id` = hec_desercioncurso.`id_curso`
                        INNER JOIN `dim_motivo` dim_motivo ON hec_desercioncurso.`id_motivo` = dim_motivo.`id`
                        INNER JOIN `dim_periodo` dim_periodo ON hec_desercioncurso.`id_periodo` = dim_periodo.`id`
                        INNER JOIN `dim_profesor` dim_profesor ON hec_desercioncurso.`id_profesor` = dim_profesor.`id`
                    WHERE
                        dim_periodo.nombre_periodo = '2011-2012'");

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