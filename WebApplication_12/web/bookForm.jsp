<%-- 
    Document   : bookForm
    Created on : May 10, 2025, 4:46:17 PM
    Author     : MSI PC
--%>

<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            BookDTO book = new BookDTO();
            try {
                book = (BookDTO) request.getAttribute("book");
            } catch (Exception e) {
            }
            if (book == null) {
                book = new BookDTO();
            }
            
            String txtBookID_error = request.getAttribute("txtBookID_error") + "";
            txtBookID_error = txtBookID_error.equals("null") ? "" : txtBookID_error;

            String txtQuantity_error = request.getAttribute("txtQuantity_error") + "";
            txtQuantity_error = txtQuantity_error.equals("null") ? "" : txtQuantity_error;

            String txtTitle_error = request.getAttribute("txtTitle_error") + "";
            txtTitle_error = txtTitle_error.equals("null") ? "" : txtTitle_error;

            String txtAuthor_error = request.getAttribute("txtAuthor_error") + "";
            txtAuthor_error = txtAuthor_error.equals("null") ? "" : txtAuthor_error;

            String txtPublishYear_error = request.getAttribute("txtPublishYear_error") + "";
            txtPublishYear_error = txtPublishYear_error.equals("null") ? "" : txtPublishYear_error;

            String txtPrice_error = request.getAttribute("txtPrice_error") + "";
            txtPrice_error = txtPrice_error.equals("null") ? "" : txtPrice_error;
        %>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add">
            Book ID <input type="text" name="txtBookID" value="<%=book.getBookID()%>"> <span style="color: red"><%= txtBookID_error%></span><br>
            Title <input type="text" name="txtTitle" value="<%=book.getBookTitle()%>"> <span style="color: red"><%=txtTitle_error%></span><br>
            Author <input type="text" name="txtAuthor" value="<%=book.getBookAuthor()%>"> <span style="color: red"><%=txtAuthor_error%></span><br>
            Publish Year <input type="text" name="txtPublishYear" value="<%=book.getPublishYear()%>"> <span style="color: red"><%=txtPublishYear_error%></span> <br>
            Price <input type="text" name="txtPrice" value="<%=book.getPrice()%>"> <span style="color: red"><%=txtPrice_error%></span><br>
            Quantity <input type="text" name="txtQuantity" value="<%=book.getQuantity()%>"> <span style="color: red"><%=txtQuantity_error%></span> <br>
            <input type="submit" value="Save" >
            <input type="reset" value="Reset"> 
        </form>

    </body>
</html>
