<%-- 
    Document   : LoginForm
    Created on : May 13, 2025, 4:32:35 PM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <!-- Đưa CSS vào trực tiếp -->
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

            .login-container {
                flex-grow: 1;
                background-color: #ffffff;
                padding: 3rem;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
                box-sizing: border-box;
                text-align: center;
                margin-top: 10rem; /* Đảm bảo form không bị che khuất bởi header */
                margin-bottom: 3rem; /* Để form không bị đè lên footer */
            }

            h2 {
                color: #333;
                font-size: 1.8rem;
                margin-bottom: 1.5rem;
            }

            input[type="emailOrPhone"],
            input[type="password"] {
                width: 100%;
                padding: 0.9rem;
                margin-bottom: 1.5rem;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 1rem;
                box-sizing: border-box;
            }

            input[type="email"]:focus,
            input[type="password"]:focus {
                border-color: #3498db;
            }

            .forgot-link {
                text-align: right;
                font-size: 0.9rem;
                color: #777;
                margin-bottom: 1.5rem;
                display: block;
            }

            .forgot-link:hover {
                color: #3498db;
                text-decoration: underline;
            }

            .error-message {
                color: red;
                font-size: 1rem;
                margin-bottom: 1rem;
            }

            .login-btn {
                background-color: #3498db;
                color: white;
                width: 100%;
                padding: 0.9rem;
                border: none;
                border-radius: 8px;
                font-size: 1.1rem;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .login-btn:hover {
                background-color: #2980b9;
            }

            .register-link {
                margin-top: 1.5rem;
                font-size: 1rem;
            }

            .register-link a {
                color: #3498db;
                text-decoration: none;
            }

            .register-link a:hover {
                text-decoration: underline;
            }

        </style>

    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="login-container">
            <h2>Đăng nhập</h2>

            <form action="loginController" method="post"> 
                <input type="hidden" value="login" name="action"> 
                <input type="emailOrPhone" name="txtEmailOrPhone" placeholder="Email hoặc Số điện thoại" required>
                <input type="password" name="txtPassword" placeholder="Mật khẩu" required>

                <a href="#" class="forgot-link">Quên mật khẩu?</a>

                <input type="submit" value="Login" class="login-btn">
            </form>

            <div class="register-link">
                Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>


