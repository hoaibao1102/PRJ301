<%-- 
    Document   : login
    Created on : May 5, 2025, 11:43:53 AM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" value="login" name="action">
            Username <input type="text" name="txtUsername"/><br/>
            Password  <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
