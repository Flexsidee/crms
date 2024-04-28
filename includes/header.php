<div class="header">
  <div class="header-content">
    <nav class="navbar navbar-expand">
      <div class="collapse navbar-collapse justify-content-between">
        <div class="header-left">
          <div class="search_bar dropdown">
            <p>Hi there</p>

          </div>
        </div>

        <ul class="navbar-nav header-right">
          <li class="nav-item dropdown notification_dropdown">
            <a class="nav-link" href="#" role="button" data-toggle="dropdown">
              <i class="mdi mdi-bell"></i>
              <div class="pulse-css"></div>
            </a>
            <?php include_once('../../includes/header-notification-dropdown.php'); ?>
          </li>
          <li class="nav-item dropdown header-profile">
            <a class="nav-link" href="#" role="button" data-toggle="dropdown">
              <i class="mdi mdi-account"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="./profile.php" class="dropdown-item">
                <i class="icon-user"></i>
                <span class="ml-2">Profile </span>
              </a>
              <a href="../actions/process_logout.php" class="dropdown-item">
                <i class="icon-key"></i>
                <span class="ml-2">Logout </span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</div>