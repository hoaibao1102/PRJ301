<%-- 
    Document   : example02
    Created on : May 4, 2025, 4:52:57 PM
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
        <%
            for (int i = 0; i < 20; i++) {
                    %>
                    <%= i %> <br>
                    <%
                }
        %>
    </body>
</html>
