<?php
session_start();

//connect to db
global $conn;
include_once '../configs/db_connection.php';

// define variables and set to empty values
$course_title = $course_code = $course_unit = $semester_id = $level_id = $department_id =  $requirement = "";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Check if course details are provided
  if (empty($_POST["course_title"]) || empty($_POST["course_code"]) || empty($_POST["course_unit"]) || empty($_POST["semester_id"]) || empty($_POST["level_id"]) || empty($_POST["department_id"]) || empty($_POST["requirement"])) {
    header("Location: ../../pages/admin/add-course.php?error=Input%20field%20can%20not%20be%20empty");
  } else {
    $course_title = test_input($_POST["course_title"]);
    $course_code = test_input($_POST["course_code"]);
    $course_unit = test_input($_POST['course_unit']);
    $semester_id = test_input($_POST['semester_id']);
    $level_id = test_input($_POST['level_id']);
    $department_id = test_input($_POST['department_id']);
    $requirement = test_input($_POST['requirement']);

    // Prepare SQL statement to insert course record
    // $sql = "INSERT INTO courses (course_title, course_code, course_unit, requirements, department_id, semester_id, level_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $sql = "INSERT INTO courses (course_title, course_code, course_unit, requirements, department_id, semester_id, level_id) VALUES ( $course_title, $course_code, $course_unit, $requirement, $department_id, $semester_id, $level_id)";
    $conn->query($sql); 
    // $stmt = $conn->prepare($sql);
    // $stmt->bind_param("sssssss", $course_title, $course_code, $course_unit, $requirement, $department_id, $semester_id, $level_id);
    // $stmt->execute();

    // Redirect user to appropriate dashboard based on role
    // header("Location: ../../pages/admin/view-courses.php");
  }
  exit();
}

function test_input($data)
{
  return htmlspecialchars(stripslashes(trim($data)));
}
