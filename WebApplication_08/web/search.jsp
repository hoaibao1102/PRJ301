<%-- 
    Document   : search
    Created on : May 5, 2025, 11:44:26 AM
    Author     : MSI PC
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)request.getAttribute("nameUser");
            String name= user.getFullName();
        %>
        <h1>WELCOME <b> <%= name %> </b> </h1>
        <h1>Search Page</h1>
        <form action="#">
            Search Value <input type="text" name="txtSeachValue" value=""/><br/>
            <input type="submit" value="Search" />
        </form>
    </body>
</html>
