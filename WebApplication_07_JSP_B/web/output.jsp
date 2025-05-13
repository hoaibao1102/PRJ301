<%-- 
    Document   : output
    Created on : May 4, 2025, 5:58:04 PM
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
            int n = (int)request.getAttribute("n");
        %>
        <h3>   CỬU CHƯƠNG <%=n %>   </h3>
        <%
            for (int i = 1; i < 10; i++) {
            %>
            <%= n%> x <%=i%> = <%= (n * i)%><br>
            <%
            }

        %>
        <hr>
        <a href="input.jsp">bấm vào đây để quay lại</a>
    </body>
</html>
