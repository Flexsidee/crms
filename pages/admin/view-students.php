<?php
session_start();

//check if student is logged in
if (!isset($_SESSION['user_id']) || $_SESSION['role'] > 2) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caleb Result Managment System </title>
  <link href="../../assets/css/style.css" rel="stylesheet">
  <!-- Datatable -->
  <link href="../../assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
  <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/caleb.png">
</head>

<body>
  <!--*******************
        Preloader start
    ********************-->
  <?php include_once('../../includes/preloader.php'); ?>
  <!--*******************
        Preloader end
    ********************-->

  <!--**********************************
        Main wrapper start
    ***********************************-->
  <div id="main-wrapper">

    <!--**********************************
            Nav header start
        ***********************************-->
    <?php include_once('../../includes/nav-header.php') ?>
    <!--**********************************
            Nav header end
        ***********************************-->

    <!--**********************************
            Header start
        ***********************************-->
    <?php include_once('../../includes/header.php'); ?>
    <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

    <!--**********************************
            Sidebar start
        ***********************************-->
    <?php include_once('../../includes/sidebar.php'); ?>
    <!--**********************************
            Sidebar end
        ***********************************-->

    <!--**********************************
            Content body start
        ***********************************-->
    <div class="content-body">
      <div class="container-fluid">
        <div class="row page-titles mx-0">
          <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
              <h4>View Students</h4>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./index.php">Home</a></li>
              <li class="breadcrumb-item active"><a href="./view-students.php">View Students</a></li>
            </ol>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <div class="table-responsive">
                  <table id="example" class="display" style="min-width: 845px">
                    <thead>
                      <tr>
                        <th>S/N</th>
                        <th>Matric No</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Department</th>
                        <th>Level</th>
                        <th>Mode of Entry</th>
                        <th>Email</th>
                        <th>Phone</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      include_once('../../configs/db_connection.php');
                      $sql = "SELECT * FROM students_view order by matric_no asc";
                      $result = $conn->query($sql);
                      $sn = 0;
                      while ($student = $result->fetch_assoc()) {
                        $sn++ ?>
                        <tr>
                          <td><?php echo $sn; ?></td>
                          <td><?php echo $student['matric_no']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['surname'] . " " . $student['firstname'] . " " . $student['othername']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['gender_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['department_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['level_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['mode_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['email']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $student['tel']; ?></td>
                        </tr>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>S/N</th>
                        <th>Matric No</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Department</th>
                        <th>Level</th>
                        <th>Mode of Entry</th>
                        <th>Email</th>
                        <th>Phone</th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--**********************************
            Content body end
        ***********************************-->


    <!--**********************************
            Footer start
        ***********************************-->
    <?php include_once('../../includes/footer.php'); ?>
    <!--**********************************
            Footer end
        ***********************************-->
  </div>
  <!--**********************************
        Main wrapper end
    ***********************************-->


  <!--**********************************
        Scripts
    ***********************************-->
  <!-- Required vendors -->
  <script src="../../assets/vendor/global/global.min.js"></script>
  <script src="../../assets/js/quixnav-init.js"></script>
  <script src="../../assets/js/custom.min.js"></script>

  <!-- Datatable -->
  <script src="../../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
  <script src="../../assets/js/plugins-init/datatables.init.js"></script>
</body>

</html>