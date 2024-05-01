<?php
session_start();
//check if student is logged in 
if (!isset($_SESSION['user_id']) || $_SESSION['role'] > 2) {
  //Redirect to login page if not logged in
  header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
  exit();
}

//db connection
include_once('../../configs/db_connection.php');

$semester_id = $level_id = $department_id = $session_id = "";
// $semester_id = $_POST['semester'];
// $level_id = $_POST['level'];
// $department_id = $_POST['department'];
// $session_id = $_POST['session'];
$session_id = 4;
$semester_id = 1;
$level_id = 4;
$department_id = 5;

// Fetch data from the database
$query = "SELECT * FROM courses INNER JOIN results ON courses.course_id = results.course_id where results.session_id=$session_id and courses.semester_id=$semester_id and courses.level_id=$level_id and courses.department_id=$department_id";

$result = mysqli_query($conn, $query);

// Store results in an array
$data = array();
while ($row = mysqli_fetch_assoc($result)) {
  $course_id = $row['course_id'];
  if (!isset($data[$course_id])) {
    $data[$course_id] = array(
      'course_id' => $row['course_id'],
      'course_code' => $row['course_code'],
      'course_unit' => $row['course_unit'],
      'results' => array()
    );
  }
  $data[$course_id]['results'][] = array(
    'student_id' => $row['student_id'],
    'ca' => $row['ca'],
    'exam' => $row['exam'],
    'total' => $row['total'],
    'grade' => $row['grade']
  );
}

$course_length = count($data);

// Convert data to JSON
$json_data = json_encode(array_values($data), JSON_PRETTY_PRINT);


echo '<script>
  console.log(' . $json_data . ')
</script>';
// Close database connection
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
                <form action="" method="post">
                  <div class="form-row">
                    <div class="form-group
                    col-md-3">
                      <label for="session">Select Session</label>
                      <select id="session" class="form-control" name="session">
                        <option selected>Select Session...</option>
                        <?php
                        $sql = "SELECT * FROM session order by session_name asc";
                        $result = $conn->query($sql);
                        while ($session = $result->fetch_assoc()) {
                          echo "<option value='" . $session['session_id'] . "'>" . $session['session_name'] . "</option>";
                        }
                        ?>
                      </select>
                    </div>
                    <div class="form-group
                    col-md-3">
                      <label for="semester">Session Semester...</label>
                      <select id="semester" class="form-control" name="semester">
                        <option value="">Select Semester</option>
                        <option value="1">First Semester</option>
                        <option value="2">Second Semester</option>
                      </select>
                    </div>
                    <div class="form-group
                    col-md-3">
                      <label for="department">Select Department...</label>
                      <select id="department" class="form-control" name="department">
                        <option value="">Select Department</option>
                        <?php
                        $sql = "SELECT * FROM departments order by department_name asc";
                        $result = $conn->query($sql);
                        while ($department = $result->fetch_assoc()) {
                          echo "<option value='" . $department['department_id'] . "'>" . $department['department_name'] . "</option>";
                        }
                        ?>
                      </select>
                    </div>
                    <div class="form-group
                    col-md-3">
                      <label for="level">Select Level...</label>
                      <select id="level" class="form-control" name="level">
                        <option value="">Select Level</option>
                        <option value="1">100</option>
                        <option value="2">200</option>
                        <option value="3">300</option>
                        <option value="4">400</option>
                      </select>
                    </div>
                  </div>
                </form>
                <div class="table-responsive mt-3">
                  <table class="display" style="min-width: 845px; border: 1px black solid">
                    <thead>
                      <tr>
                        <th rowspan="3">S/N</th>
                        <th rowspan="3">Matric No</th>
                        <th rowspan="3">Full Name</th>
                        <th rowspan="3">Mode of Entry</th>
                        <th colspan="<?php echo $course_length * 3 ?>" style="text-align: center;">Scores in Courses Taken</th>
                        <th colspan="5" style="text-align: center;">Summary Current Semester</th>
                        <!-- <th colspan="6" style="text-align: center;">Summary All Semester</th>÷ -->
                      </tr>
                      <tr>
                        <?php foreach ($data as $course) {
                          echo "<th colspan='3'>" . $course['course_unit'] . "<br>" . $course['course_code'] . "<br>" . $course['course_unit'] . "</th>";
                        } ?>
                        <th rowspan="2">TUT</th>
                        <th rowspan="2">TUP</th>
                        <th rowspan="2">WGA</th>
                        <th rowspan="2">GPA</th>
                        <th rowspan="2">UO/S</th>
                        <!-- <th rowspan="2">TUT</th>
                        <th rowspan="2">TUP</th>
                        <th rowspan="2">WGA</th>
                        <th rowspan="2">GPA</th>
                        <th rowspan="2">UO/S</th>
                        <th rowspan="2">STDN</th> -->
                      </tr>
                      <tr>
                        <?php foreach ($data as $course) {
                          echo "<th>CA</th>";
                          echo "<th>EX</th>";
                          echo "<th>TOTAL</th>";
                        } ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $sql = "SELECT * FROM students WHERE  level_id=$level_id and department_id=$department_id";
                      $result = $conn->query($sql);
                      $sn = 1;
                      while ($student = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $sn++ . "</td>";
                        echo "<td>" . $student['matric_no'] . "</td>";
                        echo "<td>" . $student['surname'] . " " . $student['first_name'] . " " . $student['other_name'] . "</td>";
                        echo "<td>" . $student['mode_of_entry'] . "</td>";
                        // Loop through courses
                        foreach ($data as $course) {
                          // Check if the student has results for this course
                          $found_result = false; // Flag to track if result is found for the current course
                          foreach ($course['results'] as $result) {
                            if ($result['student_id'] == $student['student_id']) {
                              // Student has results for this course
                              $found_result = true;
                              echo "<td>" . $result['ca'] . "</td>";
                              echo "<td>" . $result['exam'] . "</td>";
                              echo "<td>" . $result['total'] . "</td>";
                              break; // Stop searching for results once found
                            }
                          }
                          // If no result is found for the current course, display N/A
                          if (!$found_result) {
                            echo "<td>N/A</td>";
                            echo "<td>N/A</td>";
                            echo "<td>N/A</td>";
                          }
                        }
                        echo "<td><!-- Summary columns for the current semester --></td>";
                        echo "</tr>";
                      }
                      ?>

                      <!-- <tr>
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
                      </tr> -->

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