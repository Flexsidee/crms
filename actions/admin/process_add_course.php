<?php
session_start();

//connect to db
global $conn;
include_once '../../configs/db_connection.php';

// define variables and set to empty values
$course_title = $course_code = $course_unit = $semester_id = $level_id = $department_id =  $requirement = "";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $course_title = test_input($_POST["course_title"]);
  $course_code = test_input($_POST["course_code"]);
  $course_unit = test_input($_POST['course_unit']);
  $semester_id = test_input($_POST['semester_id']);
  $level_id = test_input($_POST['level_id']);
  $department_id = test_input($_POST['department_id']);
  $requirement = test_input($_POST['requirement']);

  // Check if course details are provided
  if (empty($course_title) || empty($course_code) || empty($course_unit) || empty($semester_id) || empty($level_id) || empty($department_id) || empty($requirement)) {
    header("Location: ../../pages/admin/add-course.php?error=Input%20field%20can%20not%20be%20empty");
  } else {

    // Prepare SQL statement to insert course record
    $sql = "INSERT INTO courses (course_title, course_code, course_unit, requirements, department_id, semester_id, level_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if ($stmt) {
      // Bind parameters
      $stmt->bind_param("ssssiii", $course_title, $course_code, $course_unit, $requirement, $department_id, $semester_id, $level_id);

      // Execute the statement
      $stmt->execute();

      // Check for errors
      if ($stmt->error) {
        echo "Error: " . $stmt->error;
      } else {
        // Redirect user to appropriate dashboard based on role
        header("Location: ../../pages/admin/view-courses.php?success=1");
      }

      // Close the statement
      $stmt->close();
    } else {
      echo "Error preparing statement: " . $conn->error;
    }
  }
}

function test_input($data)
{
  return htmlspecialchars(stripslashes(trim($data)));
}
