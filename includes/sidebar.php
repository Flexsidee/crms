<div class="quixnav">
  <div class="quixnav-scroll">
    <ul class="metismenu" id="menu">
      <li class="nav-label first">Main Menu</li>
      <li>
        <a href="./index.php" aria-expanded="false">
          <i class="icon icon-app-store"></i>
          <span class="nav-text">Dashboard</span>
        </a>
      </li>
      <li>
        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
          <i class="icon icon-single-copy-06"></i>
          <span class="nav-text">Courses</span>
        </a>
        <ul aria-expanded="false">
          <li><a href="./add-course.php">Add Course</a></li>
          <li><a href="./view-courses.php">Manage Courses</a></li>
        </ul>
      </li>
      <li>
        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
          <i class="icon icon-single-04"></i>
          <span class="nav-text"> Students</span>
        </a>
        <ul aria-expanded="false">
          <li><a href="./add-student.php">Add Students</a></li>
          <li><a href="./view-students.php">Manage Students</a></li>
        </ul>
      </li>
      <li>
        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
          <i class="icon icon-single-04"></i>
          <span class="nav-text"> Lecturers</span>
        </a>
        <ul aria-expanded="false">
          <li><a href="./add-lecturer.php">Add Lecturers</a></li>
          <li><a href="./view-lecturers.php">Manage Lecturers</a></li>
        </ul>
      </li>
      <?php
      session_start();

      //make only superadmin be able to view and add admins
      if ($_SESSION['role'] == 1) {
        echo '   
        <li>
          <a class="has-arrow" href="javascript:void()" aria-expanded="false">
            <i class="icon icon-single-04"></i>
            <span class="nav-text">Admins</span>
          </a>
          <ul aria-expanded="false">
            <li><a href="./add-admin.php">Add Admin</a></li>
            <li><a href="./view-admins.php">Manage Admins</a></li>
          </ul>
        </li>
        ';
      }
      ?>

      <li class="nav-label">Results</li>
      <li>
        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
          <i class="icon icon-layout-25"></i>
          <span class="nav-text"> Results</span>
        </a>
        <ul aria-expanded="false">
          <!-- <li><a href="#">Add Results</a></li> -->
          <li><a href="./view-results.php">Manage Results</a></li>
        </ul>
      </li>

      <li class="nav-label">Profile</li>
      <li>
        <a href="./profile.php" aria-expanded="false">
          <i class="icon icon-single-04"></i>
          <span class="nav-text">Profile</span>
        </a>
      </li>
    </ul>
  </div>
</div>