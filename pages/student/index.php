<?php
session_start();

//check if student is logged in
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 4) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}

// Include the database connection file
include_once('../../configs/db_connection.php');

// Get the lecturer's details from the session
$lecturerId = $_SESSION['user_id'];
$sql = "SELECT * FROM students_view WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $lecturerId);
$stmt->execute();
$result = $stmt->get_result();

// Check if a record exists
if ($result->num_rows == 1) {
  $student = $result->fetch_assoc();

  // Assign the admin's details to variables
  $studentName = $student['title_alias'] . " " . $student['surname'] . " " . $student['firstname'] . " " . $student['othername'];
  $studentMatricNumber = $student['matric_no'];
  $studentModeOfEntry = $student['mode_name'];
  $studentCurrentLevel = $student['level_name'];
  $studentDepartment = $student['department_name'];
  $studentEmail = $student['email'];
  $studentTel = $student['tel'];
  $studentGender = $student['gender_name'];
} else {
  // No record found, redirect back with an error message
  header("Location: ../../index.php?error=User%20not%20found");
  exit();
}
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
        <!-- <div class="row page-titles mx-0">
          <div class="col-sm-6 p-md-0">
            <div class="welcome-text">
              <h4>Hi <?php // echo $studentName ?>, welcome!</h4>
              <p class="mb-0">Your business dashboard template</p>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="javascript:void(0)">App</a></li>
              <li class="breadcrumb-item active"><a href="javascript:void(0)">Profile</a></li>
            </ol>
          </div>
        </div> -->

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="profile-personal-info">
                  <h4 class="text-primary mb-4">Personal Information</h4>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Name <span class="pull-right">:</span>
                      </h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentName; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Matriculation Number <span class="pull-right">:</span></h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentMatricNumber; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Department <span class="pull-right">:</span></h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentDepartment; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Current Level <span class="pull-right">:</span></h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentCurrentLevel; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Mode of Entry <span class="pull-right">:</span></h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentModeOfEntry; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Email <span class="pull-right">:</span>
                      </h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentEmail; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Phone Number <span class="pull-right">:</span>
                      </h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentTel; ?></span>
                    </div>
                  </div>
                  <div class="row mb-4">
                    <div class="col-3">
                      <h5 class="f-w-500">Gender <span class="pull-right">:</span></h5>
                    </div>
                    <div class="col-9"><span><?php echo $studentGender; ?></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="settings-form">
                  <h4 class="text-primary">Account Setting</h4>
                  <form>
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label>Email</label>
                        <input type="email" placeholder="Email" class="form-control">
                      </div>
                      <div class="form-group col-md-6">
                        <label>Password</label>
                        <input type="password" placeholder="Password" class="form-control">
                      </div>
                    </div>
                    <div class="form-group">
                      <label>Address</label>
                      <input type="text" placeholder="1234 Main St" class="form-control">
                    </div>
                    <div class="form-group">
                      <label>Address 2</label>
                      <input type="text" placeholder="Apartment, studio, or floor" class="form-control">
                    </div>
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label>City</label>
                        <input type="text" class="form-control">
                      </div>
                      <div class="form-group col-md-4">
                        <label>State</label>
                        <select class="form-control" id="inputState">
                          <option selected="">Choose...</option>
                          <option>Option 1</option>
                          <option>Option 2</option>
                          <option>Option 3</option>
                        </select>
                      </div>
                      <div class="form-group col-md-2">
                        <label>Zip</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="gridCheck">
                        <label for="gridCheck" class="form-check-label">Check me out</label>
                      </div>
                    </div>
                    <button class="btn btn-primary" type="submit">Sign
                      in</button>
                  </form>
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


</body>

</html>