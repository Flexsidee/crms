<?php
session_start();
//check if student is logged in 
if (!isset($_SESSION['user_id']) || $_SESSION['role'] > 2) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}


// include_once('../../configs/db_connection.php');
// // Fetch data from the database
// $query = "SELECT courses.course_id, courses.course_code, courses.course_unit,
// results.student_id, results.ca, results.exam, results.total, results.grade
// FROM courses
// INNER JOIN results ON courses.course_id = results.course_id";

// $result = mysqli_query($conn, $query);

// // Store results in an array
// $data = array();
// while ($row = mysqli_fetch_assoc($result)) {
// $course_id = $row['course_id'];
// if (!isset($data[$course_id])) {
// $data[$course_id] = array(
// 'course_id' => $row['course_id'],
// 'course_code' => $row['course_code'],
// 'course_unit' => $row['course_unit'],
// 'results' => array()
// );
// }
// $data[$course_id]['results'][] = array(
// 'student_id' => $row['student_id'],
// 'ca' => $row['ca'],
// 'exam' => $row['exam'],
// 'total' => $row['total'],
// 'grade' => $row['grade']
// );
// }

// Convert data to JSON
// $json_data = json_encode(array_values($data), JSON_PRETTY_PRINT);


//echo '<script>
//   console.log(' . $json_data . ')
// </script>'; 
// // Close database connection
// mysqli_close($connection);
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caleb Result Managment System </title>
  <link href="../../assets/css/style.css" rel="stylesheet">
  <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/caleb.png">

  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }

    table,
    th,
    td {
      border: 1px solid black;
      padding: 5px;
    }

    th {
      color: black;
      font-weight: bold;
    }

    td {
      text-align: center;
      color: black;
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
              <h4>View Results</h4>
            </div>
          </div>
          <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./index.php">Home</a></li>
              <li class="breadcrumb-item active"><a href="./view-results.php">View Results</a></li>
            </ol>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <!-- <div> -->
                <div class="table-responsive">
                  <!-- <table id="example" class="display" style="min-width: 845px; font-size: 70%;"> -->
                  <table class="display" style="min-width: 845px; border: 1px black solid">
                    <thead>
                      <tr>
                        <th rowspan="3">S/N</th>
                        <th rowspan="3">Matric No</th>
                        <th rowspan="3">Full Name</th>
                        <th rowspan="3">Mode of Entry</th>
                        <th colspan="21" style="text-align: center;">Scores in Courses Taken</th>
                        <th colspan="5" style="text-align: center;">Summary Current Semester</th>
                        <th colspan="6" style="text-align: center;">Summary All Semester</th>
                      </tr>
                      <tr>
                        <th colspan="3"> C <br>CSC 101 <br>3</th>
                        <th colspan="3"> C <br>GST 101 <br>3</th>
                        <th colspan="3"> C <br>GST 103 <br>3</th>
                        <th colspan="3"> C <br>MTH 101 <br>3</th>
                        <th colspan="3"> C <br>PHY 101 <br>3</th>
                        <th colspan="3"> C <br>PHY 191 <br>3</th>
                        <th colspan="3"> C <br>CHM 101 <br>3</th>
                        <th rowspan="2">TUT</th>
                        <th rowspan="2">TUP</th>
                        <th rowspan="2">WGA</th>
                        <th rowspan="2">GPA</th>
                        <th rowspan="2">UO/S</th>
                        <th rowspan="2">TUT</th>
                        <th rowspan="2">TUP</th>
                        <th rowspan="2">WGA</th>
                        <th rowspan="2">GPA</th>
                        <th rowspan="2">UO/S</th>
                        <th rowspan="2">STDN</th>
                      </tr>
                      <tr>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                        <th>SC</th>
                        <th>LG</th>
                        <th>GP</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>20/374</td>
                        <td>Isaac D.O</td>
                        <td>DE</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>60</td>
                        <td>4</td>
                        <td>12</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>21</td>
                        <td>21</td>
                        <td>84</td>
                        <td style="font-weight: bold;">4.0</td>
                        <td>0</td>
                        <td>G</td>
                      </tr>
                    </tbody>
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

</body>

</html>