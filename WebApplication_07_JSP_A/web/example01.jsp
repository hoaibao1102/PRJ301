<%-- 
    Document   : example01
    Created on : May 4, 2025, 4:02:06 PM
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
        <%! 
            int a = 9; 
        %>
        <% 
            double b ;
            b = Math.sqrt(a);
        %>
        kết quả: sqrt(<%= a %>) = <span style="color: red"><%= b %></span>;
        
        
        
    </body>
</html>
