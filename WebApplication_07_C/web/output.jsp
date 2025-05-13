<%-- 
    Document   : output
    Created on : May 4, 2025, 6:15:53 PM
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
            int n = (int )request.getAttribute("n");
            if(n%2==0){
                %>
                <%= n %> là số chẵn
                <%
            }else{
                %>
                <%= n %> là số lẻ
                <%
            }
        %>
        <hr>
        <a href="input.jsp">bấm vào đây để quay lại</a>
    </body>
</html>
