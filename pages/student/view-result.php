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
  <style>
    .top {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .resultTable {
      width: 100%;
      border: 1px grey solid;
    }

    .resultTable th {
      background-color: #f1f1f1;
      border: 1px grey solid;
    }

    .resultTable td {
      border: 1px grey solid;
    }

    .resultTable td,
    .resultTable th {
      color: black;
      padding: 10px;
    }

    .info {
      /* margin-top: 30px; */
      margin-bottom: 0;
      color: black;
      font-size: 120%;
    }
  </style>

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

        <div class="row" id="printableContent">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body" style="padding: 0">
                <div class="top px-3 pt-3">
                  <p class="info"><strong>
                      Registered course(s) and scores for 2022/2023 First semester
                    </strong>
                  </p>
                  <p class="info">Switch Semester: &nbsp;
                    <select style="padding: 5px; font-size: 90%">
                      <option>2021/2022 First</option>
                      <option>2021/2022 Second</option>
                      <option>2022/2023 First</option>
                      <option>2022/2023 Second</option>
                      <option>2023/2024 First</option>
                      <option>2023/2024 Second</option>
                    </select>
                  </p>
                </div>
                <hr />
                <div class="px-4">
                  <p class="info">Kindly view your scores below
                  </p>
                  <table class="resultTable">
                    <thead>
                      <tr>
                        <th>Course Name</th>
                        <th>Course Code</th>
                        <th>Score</th>
                        <th>Point</th>
                        <th>Grade</th>
                        <th>Unit</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Architecture and Organization I</td>
                        <td>CSC 301</td>
                        <td>74</td>
                        <td>5</td>
                        <td>A</td>
                        <td>3</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Structured Programming</td>
                        <td>CSC 301</td>
                        <td>73</td>
                        <td>5</td>
                        <td>A</td>
                        <td>3</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Object-Oriented Programming</td>
                        <td>CSC 335</td>
                        <td>74</td>
                        <td>5</td>
                        <td>A</td>
                        <td>3</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Systems Analysis and Design</td>
                        <td>CSC 311</td>
                        <td>0</td>
                        <td>0</td>
                        <td>F</td>
                        <td>4</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Data Management I</td>
                        <td>CSC 331</td>
                        <td>77</td>
                        <td>5</td>
                        <td>A</td>
                        <td>3</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Character in Leadership III</td>
                        <td>GST 311</td>
                        <td>88</td>
                        <td>5</td>
                        <td>A</td>
                        <td>1</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Computational Science and Numerical Methods</td>
                        <td>MTH 301</td>
                        <td>80</td>
                        <td>5</td>
                        <td>A</td>
                        <td>3</td>
                        <td>C</td>
                      </tr>
                      <tr>
                        <td>Introductory to Entrepreneurial Studies</td>
                        <td>GST 301</td>
                        <td>73</td>
                        <td>5</td>
                        <td>A</td>
                        <td>2</td>
                        <td>C</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="col-lg-4 px-4 mt-5 mb-5">
                  <p class="info">Kindly see results summary below</p>
                  <table class="resultTable">
                    <thead>
                      <tr>
                        <th></th>
                        <th>TCP</th>
                        <th>TNU</th>
                        <th>TNUP</th>
                        <th>GPA</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td> <strong>Current</strong></td>
                        <td>102</td>
                        <td>25</td>
                        <td>21</td>
                        <td>4.08</td>
                      </tr>
                      <tr>
                        <td><strong>Previous</strong></td>
                        <td>198</td>
                        <td>44</td>
                        <td>0</td>
                        <td>4.5</td>
                      </tr>
                      <tr>
                        <td><strong>Cummulative</strong></td>
                        <td>300</td>
                        <td>69</td>
                        <td>63</td>
                        <td>4.35</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <hr />
                <button class="btn btn-secondary ml-4 mb-4 mt-2" onclick="printDiv()">Print Result</button>
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
  <script>
    function printDiv() {
      var printContents = document.getElementById('printableContent').innerHTML;
      var originalContents = document.body.innerHTML;

      document.body.innerHTML = printContents;

      window.print();

      document.body.innerHTML = originalContents;
    }
  </script>


</body>

</html>