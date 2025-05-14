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
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                flex-direction: column;
            }

            header {
                width: 100%;
                background-color: #2c3e50;
                padding: 1rem;
                text-align: center;
                color: white;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 999;
            }

            footer {
                width: 100%;
                background-color: #2c3e50;
                padding: 1rem;
                text-align: center;
                color: white;
                position: relative;
                bottom: 0;
            }

            /* Định dạng container của form đăng ký */
            .register-container {
                background-color: #fff;
                padding: 3rem;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 450px;
                box-sizing: border-box;
                text-align: center;
                margin-top: 6rem;/* Đảm bảo form không bị che khuất bởi header */
                margin-bottom: 2rem; /* Để form không bị đè lên footer */
            }

            /* Tiêu đề form */
            .register-container h2 {
                color: #333;
                font-size: 1.8rem;
                margin-bottom: 1.5rem;
            }

            /* Định dạng các input */
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
                box-sizing: border-box;
            }

            /* Định dạng cho nhãn của các input */
            .register-container label {
                font-weight: 500;
                margin-top: 10px;
                display: block;
                text-align: left;
                width: 100%;
            }

            /* Định dạng nút đăng ký */
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

            /* Điều khoản */
            .register-container .terms {
                font-size: 13px;
                margin-top: 10px;
                text-align: left;
            }

            /* Liên kết đăng nhập */
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
        <%@include file="header.jsp" %>
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
        <%@include file="footer.jsp" %>
    </body>
</html>