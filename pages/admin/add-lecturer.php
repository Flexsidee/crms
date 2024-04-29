<?php
session_start();

//include db for page
include_once('../../configs/db_connection.php');

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
              <h4>Add Lecturer</h4>
              <p class="mb-0">Fill the form below to add lecturer</p>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./index.php">Home</a></li>
              <li class="breadcrumb-item active"><a href="./add-lecturer.php">Add Lecturer</a></li>
            </ol>
          </div>
        </div>

        <!-- row -->
        <div class="row">
          <div class="col-xl-12 col-xxl-12">
            <div class="card">
              <div class="card-body">
                <form action="../../actions/admin/process_add_lecturer.php" method="post">
                  <div class="basic-form">
                    <h4 class="mb-3">Lecturer Details</h4>
                    <?php if ($_GET['error']) echo '
                    <div class="alert alert-danger alert-dismissible alert-alt solid fade show">
                      <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close"><span><i class="mdi mdi-close"></i></span>
                      </button>
                      <strong>Error!</strong> ' . $_GET['error'] . '
                    </div>'; ?>
                    <div class="row">
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="staffId">Staff ID:</label>
                          <input type="text" name="staff_id" class="form-control" id="staffId" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="title">Title:</label>
                          <select class="form-control" name="title_id" id="title" required>
                            <option value="">Select Lecturer Title</option>
                            <?php
                            $sql = "SELECT * FROM titles order by title_name asc";
                            $result = $conn->query($sql);
                            while ($title = $result->fetch_assoc()) {
                              echo "<option value='" . $title['title_id'] . "'>" . $title['title_name'] . "</option>";
                            }
                            ?>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="surname">Surname:</label>
                          <input type="text" name="surname" class="form-control" id="surname" aria-describedby="inputGroupPrepend2" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="firstname">Firstname:</label>
                          <input type="text" name="firstname" class="form-control" id="firstname" aria-describedby="inputGroupPrepend2" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="othername">Othername:</label>
                          <input type="text" name="othername" class="form-control" id="othername" aria-describedby="inputGroupPrepend2" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="gender">Gender:</label>
                          <select class="form-control" name="gender_id" id="gender" required>
                            <option value="">Select Gender</option>
                            <?php
                            $sql = "SELECT * FROM gender order by gender_name asc";
                            $result = $conn->query($sql);
                            while ($gender = $result->fetch_assoc()) {
                              echo "<option value='" . $gender['gender_id'] . "'>" . $gender['gender_name'] . "</option>";
                            }
                            ?>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="email">Email:</label>
                          <input type="email" name="email" class="form-control" id="email" aria-describedby="inputGroupPrepend2" required>
                        </div>
                      </div>
                      <div class="col-lg-6 mb-4">
                        <div class="form-group">
                          <label class="text-label" for="phone">Phone Number:</label>
                          <input type="text" name="tel" class="form-control" id="phone" aria-describedby="inputGroupPrepend2" required>
                        </div>
                      </div>
                      <div class="col-sm-12 justify-content-sm-end d-flex ">
                        <button type="submit" class="btn btn-primary ml-3">Add Lecturer</button>
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