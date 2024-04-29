<?php
session_start();

//connect to db
global $conn;
include_once '../configs/db_connection.php';

// define variables and set to empty values
$matic_no = $surname = $firstname = $othername = $gender_id = $level_id = $mode_of_entry = $email = $phone = "";



if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $matic_no = test_input($_POST["matic_no"]);
  $surname = test_input($_POST['surname']);
  $firstname = test_input($_POST['firstname']);
  $othername = test_input($_POST['othername']);
  $gender_id = test_input($_POST['gender_id']);
  $department_id = test_input($_POST['department_id']);
  $level_id = test_input($_POST['level_id']);
  $mode_of_entry = test_input($_POST['mode_of_entry']);
  $email = test_input($_POST['email']);
  $tel = test_input($_POST['tel']);
  // Check if course details are provided
  if (empty($matic_no) || empty($title_id) || empty($surname) || empty($firstname) || empty($othername) || empty($gender_id) || empty($level_id) || empty($mode_of_entry) || empty($email) || empty($tel)) {
    header("Location: ../../pages/admin/add-course.php?error=Input%20field%20can%20not%20be%20empty");
  } else {
    // Prepare SQL statement to insert lecturer record


    // Redirect user to appropriate dashboard based on role
    // header("Location: ../../pages/admin/view-lecturers.php");
  }
  exit();
}

function test_input($data)
{
  return htmlspecialchars(stripslashes(trim($data)));
}
