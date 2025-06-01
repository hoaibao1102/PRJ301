<%-- 
    Document   : login
    Created on : May 23, 2025, 10:46:44 AM
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
            String msg = request.getAttribute("message")==null?"":request.getAttribute("message")+"";
            
        %>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            UserID : <input type="text" name="strUserID" /> <br/> 
            Password : <input type="password" name="strPassword" /> </br>
            <input type="submit" value="Login"/>
        </form>
        <span><%=msg%></span>
    </body>
</html>
