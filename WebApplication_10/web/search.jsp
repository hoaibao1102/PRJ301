<%-- 
    Document   : search
    Created on : May 5, 2025, 11:44:26 AM
    Author     : MSI PC
--%>

<%@page import="java.util.List"%>
<%@page import="dto.BookDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            * {
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .main-content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
            }



        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>

            <div class="main-content">
                <div class="login-container">
                    <%
                        if( session.getAttribute("nameUser") != null){
                        UserDTO user = (UserDTO) session.getAttribute("nameUser");
                        String name = user.getFullName();
                    %>
                    <h1>WELCOME <b> <%= name%> </b> </h1>
                    <br>
                    <form action="MainController">
                        <input type="hidden" name="action" value="logout">
                        <input type="submit" value="logout">
                    </form>
                    <h1>Search Page</h1>
                    <form action="MainController">
                        <input type="hidden" name="action" value="search">
                        Search Books <input type="text" name="txtSeachValue" value=""/><br/>
                        <input type="submit" value="Search" />
                    </form>

                    <br>
                    <br>

                    <%
                        if (request.getAttribute("books") != null) {
                            List<BookDTO> books = (List<BookDTO>)request.getAttribute("books");
                    %>
                    <table border ="1">
                        <tr>
                            <td>BookID</td>
                            <td>Title</td>
                            <td>Author</td>
                            <td>PulishYear</td>
                            <td>Price</td>
                            <td>Quantity</td>
                        </tr>

                        <%
                            for (BookDTO b : books) {
                        %>
                        <tr>
                            <td><%=b.getBookID()%></td>
                            <td><%=b.getBookTitle()%></td>
                            <td><%=b.getBookAuthor()%></td>
                            <td><%=b.getPublishYear()%></td>
                            <td><%=b.getPrice()%></td>
                            <td><%= b.getQuantity()%></td>
                           
                        </tr>

                        <%
                            }
                        %>
                    </table>

                    <%
                        }
                    %>
                    
                    <%}else { %>
                        you do not have permission to access this content
                    <%} %>
                </div>
            </div>

            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
