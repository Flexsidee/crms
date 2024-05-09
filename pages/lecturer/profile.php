<?php
session_start();

//check if student is logged in
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 3) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}

// Include the database connection file
include_once('../../configs/db_connection.php');

// // Get the student's details from the session
// $adminId = $_SESSION['user_id'];
// $sql = "SELECT * FROM student WHERE user_id = ?";
// $stmt = $conn->prepare($sql);
// $stmt->bind_param("s", $adminId);
// $stmt->execute();
// $result = $stmt->get_result();

// // Check if a record exists
// if ($result->num_rows == 1) {
//   $admin = $result->fetch_assoc();

//   // Assign the admin's details to variables
//   $adminEmail = $admin['email'];
// } else {
//   // No record found, redirect back with an error message
//   header("Location: ../index.php?error=User%20not%20found");
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
    <?php include_once('../../includes/sidebar_lecturer.php'); ?>
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
              <!-- <h4>Hi, welcome <?php echo $adminEmail ?>!</h4> -->
              <p class="mb-0">Your business dashboard template</p>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="javascript:void(0)">App</a></li>
              <li class="breadcrumb-item active"><a href="javascript:void(0)">Profile</a></li>
            </ol>
          </div>
        </div>
        <!-- row -->
        <div class="row">
          <div class="col-lg-12">
            <div class="profile">
              <div class="profile-head">
                <div class="photo-content">
                  <div class="cover-photo"></div>
                  <div class="profile-photo">
                    <img src="../../assets/images/profile/profile.png" class="img-fluid rounded-circle" alt="">
                  </div>
                </div>
                <div class="profile-info">
                  <div class="row justify-content-center">
                    <div class="col-xl-8">
                      <div class="row">
                        <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                          <div class="profile-name">
                            <h4 class="text-primary">Mitchell C. Shay</h4>
                            <p>UX / UI Designer</p>
                          </div>
                        </div>
                        <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                          <div class="profile-email">
                            <h4 class="text-muted">hello@email.com</h4>
                            <p>Email</p>
                          </div>
                        </div>
                        <!-- <div class="col-xl-4 col-sm-4 prf-col">
                                                    <div class="profile-call">
                                                        <h4 class="text-muted">(+1) 321-837-1030</h4>
                                                        <p>Phone No.</p>
                                                    </div>
                                                </div> -->
                      </div>
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
                <div class="profile-tab">
                  <div class="custom-tab-1">
                    <ul class="nav nav-tabs">
                      <li class="nav-item"><a href="#about-me" data-toggle="tab" class="nav-link">About Me</a>
                      </li>
                      <li class="nav-item"><a href="#profile-settings" data-toggle="tab" class="nav-link">Setting</a>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div id="about-me" class="tab-pane fade">
                        <div class="profile-about-me">
                          <div class="pt-4 border-bottom-1 pb-4">
                            <h4 class="text-primary">About Me</h4>
                            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence was created for the
                              bliss of souls like mine.I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents.</p>
                            <p>A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed
                              in a nice, gilded frame.</p>
                          </div>
                        </div>
                        <div class="profile-skills pt-2 border-bottom-1 pb-2">
                          <h4 class="text-primary mb-4">Skills</h4>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Admin</a>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Dashboard</a>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Photoshop</a>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Bootstrap</a>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Responsive</a>
                          <a href="javascript:void()" class="btn btn-outline-dark btn-rounded pl-4 my-3 my-sm-0 pr-4 mr-3 m-b-10">Crypto</a>
                        </div>
                        <div class="profile-lang pt-5 border-bottom-1 pb-5">
                          <h4 class="text-primary mb-4">Language</h4><a href="javascript:void()" class="text-muted pr-3 f-s-16"><i class="flag-icon flag-icon-us"></i> English</a> <a href="javascript:void()" class="text-muted pr-3 f-s-16"><i class="flag-icon flag-icon-fr"></i> French</a>
                          <a href="javascript:void()" class="text-muted pr-3 f-s-16"><i class="flag-icon flag-icon-bd"></i> Bangla</a>
                        </div>
                        <div class="profile-personal-info">
                          <h4 class="text-primary mb-4">Personal Information</h4>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Name <span class="pull-right">:</span>
                              </h5>
                            </div>
                            <div class="col-9"><span>Mitchell C.Shay</span>
                            </div>
                          </div>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Email <span class="pull-right">:</span>
                              </h5>
                            </div>
                            <div class="col-9"><span>example@examplel.com</span>
                            </div>
                          </div>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Availability <span class="pull-right">:</span></h5>
                            </div>
                            <div class="col-9"><span>Full Time (Free Lancer)</span>
                            </div>
                          </div>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Age <span class="pull-right">:</span>
                              </h5>
                            </div>
                            <div class="col-9"><span>27</span>
                            </div>
                          </div>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Location <span class="pull-right">:</span></h5>
                            </div>
                            <div class="col-9"><span>Rosemont Avenue Melbourne,
                                Florida</span>
                            </div>
                          </div>
                          <div class="row mb-4">
                            <div class="col-3">
                              <h5 class="f-w-500">Year Experience <span class="pull-right">:</span></h5>
                            </div>
                            <div class="col-9"><span>07 Year Experiences</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div id="profile-settings" class="tab-pane fade">
                        <div class="pt-3">
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