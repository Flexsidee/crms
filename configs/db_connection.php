<?php
// Database configuration
$db_host = 'localhost'; // Your host
$db_name = 'crms'; // Your database name
$db_username = 'root'; // Your database username
$db_password = ''; // Your database password



// Create connection
$conn = new mysqli($db_host, $db_username, $db_password, $db_name);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Optionally, you can set the character set to utf8mb4 for proper handling of Unicode characters
mysqli_set_charset($conn, "utf8mb4");
