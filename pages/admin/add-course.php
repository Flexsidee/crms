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
                <form action="#">
                  <div>
                    <h4 class="mb-3">Course Details</h4>
                    <section>
                      <div class="row">
                        <div class="col-lg-12 mb-4">
                          <div class="form-group">
                            <label class="text-label" for='title'>Course Title*</label>
                            <input type="text" name="firstName" class="form-control" placeholder="e.g Introduction to Computer Science" required id="title">
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Couse Code</label>
                            <input type="text" name="lastName" class="form-control" placeholder="e.g COM 101" required>
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Course Unit*</label>
                            <div class="input-group">
                              <input type="email" class="form-control" id="inputGroupPrepend2" aria-describedby="inputGroupPrepend2" placeholder="e.g 3" required>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Semester*</label>
                            <div class="input-group">
                              <input type="text" name="phoneNumber" class="form-control" placeholder="Select semester" required>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Level</label>
                            <input type="text" name="place" class="form-control" placeholder="Select level" required>
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Department</label>
                            <input type="text" name="place" class="form-control" placeholder="Select Department" required>
                          </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                          <div class="form-group">
                            <label class="text-label">Elective or Required</label>
                            <input type="text" name="place" class="form-control" placeholder="Select one or the rwo" required>
                          </div>
                        </div>
                      </div>
                    </section>
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