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
            #mtContainer {
                display: none;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .login-container {
                background-color: #fff;
                padding: 2.5rem;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px; /* Cố định độ rộng tối đa của form */
                box-sizing: border-box;
            }

            h2 {
                text-align: center;
                color: #2c3e50;
                margin-bottom: 2rem;
            }

            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 0.8rem;
                margin-bottom: 1.2rem;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 1rem;
                box-sizing: border-box;
            }

            .forgot-link {
                text-align: right;
                font-size: 0.9rem;
                color: #888;
                margin-bottom: 1rem;
                display: block;
            }

            .forgot-link:hover {
                text-decoration: underline;
            }

            .error-message {
                color: red;
                font-size: 0.95rem;
                text-align: center;
                margin-bottom: 1rem;
            }

            .login-btn {
                background-color: #6c5ce7;
                color: white;
                width: 100%;
                padding: 0.8rem;
                border: none;
                border-radius: 8px;
                font-size: 1rem;
                font-weight: bold;
                cursor: pointer;
            }

            .login-btn:hover {
                background-color: #5a4bd8;
            }

            .register-link {
                text-align: center;
                margin-top: 1rem;
                font-size: 0.95rem;
            }

            .register-link a {
                color: #6c5ce7;
                text-decoration: none;
            }

            .register-link a:hover {
                text-decoration: underline;
            }
        </style>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="login-container">
            <h2>Đăng nhập</h2>

            <form action="login" method="post">
                <input type="email" name="email" placeholder="Email hoặc Số điện thoại" required>
                <input type="password" name="password" placeholder="Mật khẩu" required>

                <a href="#" class="forgot-link">Quên mật khẩu?</a>

                <input type="submit" value="Đăng nhập" class="login-btn">
            </form>

            <div class="register-link">
                Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>


