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

        
        
        <!--        CSS-->
        <style>
            /* CHUNG CHO TOÀN TRANG */
            body {
                background-color: #f2f2f2;
                color: #333;
            }

            /* Container chính */
            .container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            /* Phần nội dung giữa */
            .main-content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: flex-start; /* canh top */
                padding: 40px 20px;
            }

            /* Dùng lại lớp login-container để bọc nội dung search */
            .login-container {
                width: 100%;
                max-width: 900px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                padding: 30px;
            }

            /* Tiêu đề Welcome & Search */
            .login-container h1,
            .login-container h2 {
                margin: 0 0 20px;
                font-size: 24px;
                text-align: center;
                color: #007bff;
            }

            /* Form logout và search */
            .login-container form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 20px;
            }

            /* Ẩn border mặc định nếu có */
            .login-container form input[type="hidden"] {
                display: none;
            }

            /* Input tìm kiếm */
            .login-container form input[type="text"] {
                width: 300px;
                padding: 10px 12px;
                border: 1px solid #ccc;
                border-radius: 4px 0 0 4px;
                font-size: 16px;
                outline: none;
            }

            /* Nút Search / Logout */
            .login-container form input[type="submit"],
            .login-container form button {
                padding: 10px 16px;
                border: none;
                background-color: #007bff;
                color: white;
                cursor: pointer;
                font-size: 16px;
                border-radius: 0 4px 4px 0;
                transition: background-color 0.2s;
            }

            .login-container form input[type="submit"]:hover,
            .login-container form button:hover {
                background-color: #0056b3;
            }

            /* Bảng kết quả */
            .login-container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .login-container th,
            .login-container td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            .login-container thead {
                background-color:#1f7b4d;
                color: #fff;
                font-size: 19px;
            }

            .login-container tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
            }

            .login-container tbody tr:hover {
                background-color: #e1f0ff;
            }

            /* Thông báo không quyền */
            .login-container p {
                text-align: center;
                color: #e74c3c;
                margin-top: 20px;
            }
            
            
        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>

            <div class="main-content">
                <div class="login-container">
                    <%
                        if (session.getAttribute("nameUser") != null) {
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
                    <%
                        String txtSearchValue = request.getAttribute("txtSeachValue")+"";
                        txtSearchValue = txtSearchValue.equals("null")?"":txtSearchValue;
                    %>
                    <form action="MainController">
                        <input type="hidden" name="action" value="search">
                        Search Books <input type="text" name="txtSearchValue" value="<%=txtSearchValue%>"/><br/>
                        <input type="submit" value="Search" />
                    </form>

                    <br>
                    <br>

                    <%
                        if (request.getAttribute("books") != null) {
                            List<BookDTO> books = (List<BookDTO>) request.getAttribute("books");
                    %>
                    <table border ="1">
                        <thead>
                            <tr>
                                <td>BookID</td>
                                <td>Title</td>
                                <td>Author</td>
                                <td>PulishYear</td>
                                <td>Price</td>
                                <td>Quantity</td>
                                <td>Action</td>
                            </tr>
                        </thead>

                        <tbody>
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
                                <td>
                                    <a href="MainController?action=delete&id=<%=b.getBookID()%>&txtSearchValue=<%=txtSearchValue%>">
                                        <img src="assets/images/recyclebin-icon.png" style="height: 25px;" >
                                    </a>
                                </td>

                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                       
                    </table>

                    <%
                        }
                    %>

                    <%} else { %>
                    you do not have permission to access this content
                    <%}%>
                </div>
            </div>

            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
