<?php
//start session
session_start();

//connect to db
global $conn;
include_once '../configs/db_connection.php';

// define variables and set to empty values
$username = $password = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Check if username and password are provided
  if (empty($_POST["username"]) || empty($_POST["password"])) {
    header("Location: ../index.php?error=Username%20and%20password%20can%20not%20be%20empty");
    exit();
  } else {
    $username = test_input($_POST["username"]);
    $password = test_input($_POST["password"]);

    // Prepare SQL statement to select user record based on matriculation number
    $sql = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if a record exists
    if ($result->num_rows == 1) {
      // Record exists, fetch the row and compare passwords
      $user = $result->fetch_assoc();
      if ($password == $user['password']) {
        // Passwords match, Store user data in session and redirect to profile page
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role_id'];

        // Redirect user to appropriate dashboard based on role
        if ($user['role_id'] == 1) {
          header("Location: ../pages/admin/");
        } elseif ($user['role_id'] == 2) {
          header("Location: ../pages/admin/");
        } elseif ($user['role_id'] == 3) {
          header("Location: ../pages/lecturer/");
        } elseif ($user['role_id'] == 4) {
          header("Location: ../pages/student/");
        }
      } else {
        // Password doesn't match, redirect back with an error message
        header("Location: ../index.php?error=Invalid%20login%20details");
      }
    } else {
      // No record found, redirect back with an error message
      header("Location: ../index.php?error=User%20not%20found");
    }
    exit();
  }
}

function test_input($data)
{
  return htmlspecialchars(stripslashes(trim($data)));
}
