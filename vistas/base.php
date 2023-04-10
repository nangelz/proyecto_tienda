<?php
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['nombre'])) {
  header("Location: login.html");
}else{

require 'header.php';?>

<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">

      <div class="panel-body">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
          <div class="small-box">
            <div class="container">
              <hr>
              <div class="row justify-content-center">
                <div class="col-sm-6">
                  <?php
                    if(isset($_SESSION['error'])){
                      ?>
                      <div class="alert alert-danger text-center">
                        <?php echo $_SESSION['error']; ?>
                      </div>
                      <?php
            
                      unset($_SESSION['error']);
                    }
            
                    if(isset($_SESSION['success'])){
                      ?>
                      <div class="alert alert-success text-center">
                        <?php echo $_SESSION['success']; ?>
                      </div>
                      <?php
            
                      unset($_SESSION['success']);
                    }
                  ?>
                  <div class="card">
                    <div class="card-body">
                      <br>
                      <div><a href="../config/respaldo.php " style="color:green;"><i class="fa fa-download"></i> Descargar Base de datos actual</a></div>
                      <hr>

                      <form method="POST" action="../config/restore.php" enctype="multipart/form-data">
                          <div class="form-group row">
                              <div class="col-sm-9">
                                <input type="file" class="form-control-file" id="sql" name="sql" placeholder="base de datos que deseas restaurar" required>
                              </div>
                          </div>
                          <button type="submit" class="btn btn-primary" name="restore">Restaurar</button>
                      </form>
                      <br>
                      <hr>
                      
                      <div><a href="../config/eliminar.php" style="color:red;"><i class="fa fa-trash"></i> Eliminar Base de datos actual</a></div>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</div>
<?php
require 'footer.php';
 ?>
 <script src="../public/js/Chart.bundle.min.js"></script>
 <script src="../public/js/Chart.min.js"></script>

 <?php 
}
ob_end_flush();
  ?>

