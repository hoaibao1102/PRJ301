<%-- 
    Document   : RegisForm
    Created on : May 13, 2025, 4:54:54 PM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register - Tour Booking</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f2f6ff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .register-container {
      background: #fff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      width: 400px;
      margin: auto;
    }

    .register-container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #2c3e50;
    }

    .register-container input[type="text"],
    .register-container input[type="email"],
    .register-container input[type="tel"],
    .register-container input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    .register-container label {
      font-weight: 500;
      margin-top: 10px;
      display: block;
    }

    .register-container button {
      width: 100%;
      padding: 12px;
      background: #3498db;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      margin-top: 20px;
      cursor: pointer;
    }

    .register-container button:hover {
      background: #2980b9;
    }

    .register-container .terms {
      font-size: 13px;
      margin-top: 10px;
    }

    .register-container .login-link {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .register-container .login-link a {
      color: #3498db;
      text-decoration: none;
    }

    .register-container .login-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="register-container">
    <h2>Create Your Account</h2>

    <form>
      <label for="name">Full Name</label>
      <input type="text" id="name" placeholder="John Doe" required>

      <label for="email">Email Address</label>
      <input type="email" id="email" placeholder="example@email.com" required>

      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" placeholder="0123 456 789" required>

      <label for="address">Address (Optional)</label>
      <input type="text" id="address" placeholder="123 Street, City">

      <label for="password">Password</label>
      <input type="password" id="password" placeholder="********" required>

      <label for="confirm">Confirm Password</label>
      <input type="password" id="confirm" placeholder="********" required>

      <div class="terms">
        <input type="checkbox" id="agree" required>
        <label for="agree">I agree to the <a href="#">Terms & Conditions</a></label>
      </div>

      <button type="submit">Sign Up</button>
    </form>

    <div class="login-link">
      Already have an account? <a href="#">Login here</a>
    </div>
  </div>
</body>
</html>