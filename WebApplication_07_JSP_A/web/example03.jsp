<%-- 
    Document   : example03
    Created on : May 4, 2025, 4:56:15 PM
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
        <%! int a = 100;%>
        <%
            if (a % 2 == 0) {
        %>
        <%= a%> la so chan
        <%
        } else {
        %>
        <%= a%> la so le
        <%
            }

        %>
    </body>
</html>
