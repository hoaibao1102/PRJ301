<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .main-content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login-container {
                width: 100%;
                max-width: 400px;
                padding: 30px 40px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .login-container h2 {
                text-align: center;
                margin-bottom: 25px;
                color: #333;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 8px 0 20px 0;
                border: 1px solid #ccc;
                border-radius: 6px;
            }

            .login-container input[type="submit"] {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
            }

            .login-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            
        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>

            <div class="main-content">
                <div class="login-container">
                    <h2>Login</h2>
                    <form action="MainController" method="post">
                        <input type="hidden" value="login" name="action">
                        <input type="text" name="txtUsername" placeholder="Username" required />
                        <input type="password" name="txtPassword" placeholder="Password" required />
                        <input type="submit" value="Login" />
                    </form>
                    
                    <%
                        String mess = request.getAttribute("message")+"";
                    %>
                    <p style="color: red; text-align: center; margin: 8px">
                         <%= mess.equals("null")?"":mess %>
                    </p>
                   
                </div>
            </div>

            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
