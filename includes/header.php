<?php
session_start();
include_once('../configs/db_connection.php');

// $username = $_SESSION['username'];
// $user_id = $_SESSION['user_id'];
// $role_id = $_SESSION['role'];
// $sql = "";

// if ($role_id == 4) {
//   $sql = "SELECT * FROM students WHERE user_id = ?";
// } else if ($role_id == 3) {
//   $sql = "SELECT * FROM lecturers WHERE user_id = ?";
// } else {
//   $sql = "SELECT * FROM admins WHERE user_id = ?";
// }
// $stmt = $conn->prepare($sql);
// $stmt->bind_param("s", $user_id);
// $stmt->execute();
// $result = $stmt->get_result();

// if ($result->num_rows == 1) {
//   $name = $result->fetch_assoc();
//   $firstname = $name['firstname'];
// } else {
//   $firstname = "User";
// }


?>

<div class="header">
  <div class="header-content">
    <nav class="navbar navbar-expand">
      <div class="collapse navbar-collapse justify-content-between">
        <div class="header-left mt-3">
          <h4 style=" text-transform: capitalize;	">
            Hi
            <?php //echo $firstname; 
            ?>
          </h4>
        </div>

        <ul class="navbar-nav header-right">
          <!-- <li class="nav-item dropdown notification_dropdown">
            <a class="nav-link" href="#" role="button" data-toggle="dropdown">
              <i class="mdi mdi-bell"></i>
              <div class="pulse-css"></div>
            </a>
            <?php //include_once('../../includes/header-notification-dropdown.php'); 
            ?>
          </li> -->
          <li class="nav-item dropdown header-profile">
            <a class="nav-link" href="#" role="button" data-toggle="dropdown">
              <i class="mdi mdi-account"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="./profile.php" class="dropdown-item">
                <i class="icon-user"></i>
                <span class="ml-2">Profile </span>
              </a>
              <a href="../../actions/process_logout.php" class="dropdown-item">
                <i class="icon-key"></i>
                <span class="ml-2">Logout </span>
              </a>
            </div>
        </ul>
      </div>
    </nav>
  </div>
</div>