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
              <h4>Add Course</h4>
              <p class="mb-0">Fill the form below to add course</p>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active"><a href="./add-course.php">Add Course</a></li>
            </ol>
          </div>
        </div>

        <!-- row -->
        <div class="row">
          <div class="col-xl-12 col-xxl-12">
            <div class="card">
              <div class="card-body">
                <form action="../../actions/admin/process_add_course.php" method="post">
                  <div class="basic-form">
                    <h4 class="mb-3">Course Details</h4>
                    <?php if ($_GET['error']) echo '
                    <div class="alert alert-danger alert-dismissible alert-alt solid fade show">
                      <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span>
                      </button>
                      <strong>Error!</strong> ' . $_GET['error'] . '
                    </div>'; ?>
                    <div class="row">
                      <div class="col-lg-12 mb-4">
                        <div class="form-group">
                          <label class="text-label" for='courseTitle'>Course Title:</label>
                          <input type="text" name="course_title" class="form-control" placeholder="Enter course title" required id="courseTitle">
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="courseCode">Couse Code:</label>
                          <input type="text" name="course_code" class="form-control" id="courseCode" placeholder=" Enter course code" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="courseUnit">Course Unit:</label>
                          <input type="number" name="course_unit" class="form-control" id="courseUnit" aria-describedby="inputGroupPrepend2" placeholder="Enter course Unit" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="semester">Semester:</label>
                          <select class="form-control" id="semester" name="semester_id" required id="semester" placeholder="Select semester">
                            <option value="">Select Semester</option>
                            <option value="1">First Semester</option>
                            <option value="2">Second Semester</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="level">Level:</label>
                          <select class="form-control" id="level" name="level_id" placeholder="Select Level" required>
                            <option value="">Select Level</option>
                            <option value="1">100</option>
                            <option value="2">200</option>
                            <option value="3">300</option>
                            <option value="4">400</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="department">Department:</label>
                          <select class="form-control" name="department_id" id="department" placeholder="Select Department" required>
                            <option value="">Select Department</option>
                            <?php
                            include_once('../../configs/db_connection.php');
                            $sql = "SELECT * FROM departments order by department_name asc";
                            $result = $conn->query($sql);
                            while ($department = $result->fetch_assoc()) {
                              echo "<option value='" . $department['department_id'] . "'>" . $department['department_name'] . "</option>";
                            }
                            ?>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="requirement">Course Type:</label>
                          <select class="form-control" name="requirement" id="requirement" placeholder="Select course type" required>
                            <option value="">Select one</option>
                            <option value="E">Elective</option>
                            <option value="C">Compulsory</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-sm-12 justify-content-sm-end d-flex ">
                        <button type="submit" class="btn btn-primary ml-3">Add Course</button>
                      </div>
                    </div>
                  </div>
                </form>
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