<%-- 
    Document   : header
    Created on : May 6, 2025, 1:02:03 PM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #333;
                color: white;
                padding: 10px 20px;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
            }

            nav {
                display: flex;
                gap: 15px;
            }

            nav a {
                color: white;
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 4px;
            }

            nav a:hover {
                background-color: #555;
            }

            .auth-buttons {
                display: flex;
                gap: 10px;
            }

            .auth-buttons button {
                width: 65%;
                padding: 8px 14px;
                border: none;
                border-radius: 4px;
                background-color: #007BFF;
                color: white;
                cursor: pointer;
            }

            .auth-buttons button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="logo">LOGO</div>

            <nav>
                <a href="#">Giới thiệu</a>
                <a href="#">Sản phẩm</a>
                <a href="#">Tìm kiếm</a>
                <a href="#">Giỏ hàng</a>
            </nav>

            <div class="auth-buttons">
                <button>Login</button>
                <button>Logout</button>
            </div>
        </header>
    </body>
</html>
