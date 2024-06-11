<?php
session_start();

//check if student is logged in
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 4) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}

// Include the database connection file
// include_once('../../configs/db_connection.php');

// Get the lecturer's details from the session
// $lecturerId = $_SESSION['user_id'];
// $sql = "SELECT * FROM students_view WHERE user_id = ?";
// $stmt = $conn->prepare($sql);
// $stmt->bind_param("s", $lecturerId);
// $stmt->execute();
// $result = $stmt->get_result();

// Check if a record exists
// if ($result->num_rows == 1) {
//   $student = $result->fetch_assoc();

//   // Assign the admin's details to variables
//   $studentName = $student['title_alias'] . " " . $student['surname'] . " " . $student['firstname'] . " " . $student['othername'];
//   $studentMatricNumber = $student['matric_no'];
//   $studentModeOfEntry = $student['mode_name'];
//   $studentCurrentLevel = $student['level_name'];
//   $studentDepartment = $student['department_name'];
//   $studentEmail = $student['email'];
//   $studentTel = $student['tel'];
//   $studentGender = $student['gender_name'];
// } else {
//   // No record found, redirect back with an error message
//   header("Location: ../../index.php?error=User%20not%20found");
//   exit();
// }
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Caleb Result Managment System</title>
  <!-- Favicon icon -->
  <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
  <link href="../../assets/css/style.css" rel="stylesheet">
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
    <?php include_once('../../includes/sidebar_student.php'); ?>
    <!--**********************************
            Sidebar end
        ***********************************-->

    <!--**********************************
            Content body start
        ***********************************-->
    <div class="content-body">
      <div class="container-fluid">

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">

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


</body>

</html>