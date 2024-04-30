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

  <!-- Toastr -->
  <link rel="stylesheet" href="../../assets/vendor/toastr/css/toastr.min.css">
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
              <h4>View Courses</h4>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./index.php">Home</a></li>
              <li class="breadcrumb-item active"><a href="./view-courses.php">Manage Courses</a></li>
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
                        <th>Course Code</th>
                        <th>Course Title</th>
                        <th>Course Unit</th>
                        <th>Level</th>
                        <th>Department</th>
                        <th>Semester</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      include_once('../../configs/db_connection.php');
                      $sql = "SELECT * FROM courses_view order by course_code asc";
                      $result = $conn->query($sql);
                      $sn = 0;
                      while ($course = $result->fetch_assoc()) {
                        $sn++ ?>
                        <tr>
                          <td><?php echo $sn; ?></td>
                          <td style="text-transform: uppercase;"><?php echo $course['course_code']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['course_title']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['course_unit']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['level_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['department_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['semester_name']; ?></td>
                          <td style="text-transform: capitalize;"><?php echo $course['requirements']; ?></td>
                        </tr>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>S/N</th>
                        <th>Course Code</th>
                        <th>Course Title</th>
                        <th>Course Unit</th>
                        <th>Level</th>
                        <th>Department</th>
                        <th>Semester</th>
                        <th>Status</th>
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

  <!-- Toastr -->
  <script src="../../assets/vendor/toastr/js/toastr.min.js"></script>

  <?php
  if (isset($_GET['success']) && $_GET['success'] == 1) {
    echo
    '<script>
      window.addEventListener("load", function() {
        toastr.success("The course was added successfully", "Course Added", {
          positionClass: "toast-top-right",
          timeOut: 5e3,
          closeButton: !0,
          debug: !1,
          newestOnTop: !0,
          progressBar: !0,
          preventDuplicates: !0,
          onclick: null,
          showDuration: "300",
          hideDuration: "1000",
          extendedTimeOut: "1000",
          showEasing: "swing",
          hideEasing: "linear",
          showMethod: "fadeIn",
          hideMethod: "fadeOut",
          tapToDismiss: !1
        })
      });
    </script>';
  } ?>

</body>

</html>