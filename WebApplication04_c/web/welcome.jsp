<%-- 
    Document   : welcome
    Created on : May 23, 2025, 10:59:13 AM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.UserDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             UserDTO user = (UserDTO)request.getAttribute("userDTO");
        %>
        
        <h1>WELCOME <%=user.getFullName()%></h1>
    </body>
</html>
