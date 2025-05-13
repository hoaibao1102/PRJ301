<%-- 
    Document   : example04
    Created on : May 4, 2025, 5:06:08 PM
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
            for (int i = 1; i < 10; i++) {
                    for (int j = 1; j <= 10; j++) {
                            %>
                            <%= i%> x <%=j%> = <%= (i*j) %><br>
                            <%
                        }
                        
                }
        %>
    </body>
</html>
