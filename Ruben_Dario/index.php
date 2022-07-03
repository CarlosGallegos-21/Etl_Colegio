<html lang="es">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    
    <title>HOLA MUNDO</title>
  </head>
  <body>  
    <div class="col-lg-12" style="padding-top: 20px;">
      <div class="card">
        <div class="card-header">
          <center>
            <h4>REPORTE DE DESERCIÓN DE CURSO POR MOTIVO CAMBIO DE COLEGIO</h4>
          </center>
        </div>
        <center>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-12">
                <form action="desercion.php">
                  <select name="periodo" id="periodo">

                    <?php
                      include('conexion.php');
                      $query = "SELECT nombre_periodo FROM datamartcolegio.dim_periodo";


                      if ($stmt = $mysqli->prepare($query)) {
                          $stmt->execute();
                          $stmt->bind_result($nombre_periodo);
                          while ($stmt->fetch()) {
                            echo '<option value="'.$nombre_periodo.'">'.$nombre_periodo.'</option>';
                          }
                          $stmt->close();
                      }
                    ?>
                  </select>
                  
                </form>
                <button href="#" class="btn btn-primary" id="btnCargar" onclick="cargarDatos()">Reporte</button>
                <div style="width: 30%">
                <canvas id="cnImagen" width="225" height="225"></canvas>
                  <canvas id="canvas" width="400" height="400"></canvas>
              </div>
              </div>
            </div>
          </div>
        </center>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/parametro.js"></script>
    <center>
      Copyright &copy; 2022 Carlos Gallegos Estudiante de la FACCI de la ULEAM-Manabí-Ecuador
    </center>
    
  </body>
</html>