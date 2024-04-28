<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Caleb Result Managment System</title>
  <link rel="stylesheet" href="./assets/css/login.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>

<body>

  <div class="main-container">
    <div class="login-container">
      <h4>Login</h4>
      <h6>Enter your account details</h6>

      <?php if ($_GET['error']) echo '<h3 style="color: red; text-align: left;" class="error-message"><em>' . $_GET['error'] . '</em></h3>'; ?>

      <form method="post" action="./actions/process_login.php">
        <!-- Input fields -->
        <div class="input-container">
          <label>
            <input type="text" placeholder="Username" class="login-input" name="username" required  >
          </label>

          <div style="position: relative;">
            <input type="password" placeholder="Password" class="login-input" id="passwordInput" name="password" required>
            <img src="./assets/images/svg/EyeSlashFill.svg" alt="eye" class="peek-icon" onclick="togglePasswordVisibility()">
          </div>
        </div>


        <!-- <p class="forgot-password">Forgot password?</p> -->

        <button class="login-button">Login</button>
      </form>

      <!-- <div class="signup-section">
                <p class="signup-text">Don’t have an account?</p>
                <button class="signup-button">Signup</button>
            </div> -->
    </div>


    <div class="loginimage">
      <img src="./assets/images/Login.png" alt="pic">
    </div>
  </div>
  <script>
    function togglePasswordVisibility() {
      var passwordInput = document.getElementById("passwordInput");
      passwordInput.type = passwordInput.type === "password" ? "text" : "password";
    }
  </script>
</body>

</html>