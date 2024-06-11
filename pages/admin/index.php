<?php
session_start();

//include db for page
include_once('../../configs/db_connection.php');

//check if student is logged in
if (!isset($_SESSION['user_id']) || $_SESSION['role'] > 2) {
    //Redirect to login page if not logged in
    header("Location: ../../index.php?error=You%20need%20to%20login%20to%20acces%20this%20website");
    exit();
}

// Define SQL queries to count records in each table
$queries = array(
    'students' => 'SELECT COUNT(*) FROM students',
    'lecturers' => 'SELECT COUNT(*) FROM lecturers',
    'admins' => 'SELECT COUNT(*) FROM admins',
    'departments' => 'SELECT COUNT(*) FROM departments',
    'faculties' => 'SELECT COUNT(*) FROM faculty',
    'courses' => 'SELECT COUNT(*) FROM courses',
    // Add queries for other tables as needed
);

// Execute queries and retrieve counts
$counts = array();
foreach ($queries as $table => $query) {
    $result = $conn->query($query);
    $row = $result->fetch_row();
    $counts[$table] = $row[0];
}

// Close the database connection
$conn->close();
?>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Caleb Result Managment System --Admin</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/caleb.png">
    <link href="../../assets/css/style.css" rel="stylesheet">

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
                            <h4>Dashboard</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Home</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-user text-primary border-primary"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Students</div>
                                    <div class="stat-digit"><?php echo $counts['students']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-user text-primary border-primary"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Lecturers</div>
                                    <div class="stat-digit"><?php echo $counts['lecturers']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-user text-primary border-primary"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Admins</div>
                                    <div class="stat-digit"><?php echo $counts['admins']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-layout-grid2 text-pink border-pink"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Faculties</div>
                                    <div class="stat-digit"><?php echo $counts['faculties']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-layout-grid2 text-pink border-pink"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Departments</div>
                                    <div class="stat-digit"><?php echo $counts['departments']; ?></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-layout-grid2 text-pink border-pink"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">Total Courses</div>
                                    <div class="stat-digit"><?php echo $counts['courses']; ?></div>
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




    <script src="../../assets/js/dashboard/dashboard-2.js"></script>
    <!-- Circle progress -->

</body>

</html>