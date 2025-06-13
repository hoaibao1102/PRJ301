<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 8:16:21 AM
    Author     : tungi
--%>
<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Management</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }
            .page-content {
                padding: 40px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: calc(100vh - 150px);
            }
            .form-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
            }
            h1 {
                color: #2c3e50;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #333;
            }
            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }
            input[type="text"]:focus, input[type="number"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }
            .error-message {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 5px;
            }
            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            button, input[type="submit"], input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                flex: 1;
                margin-right: 10px;
            }
            input[type="submit"]:hover {
                background-color: #27ae60;
            }
            input[type="reset"] {
                background-color: #e74c3c;
                color: white;
                flex: 1;
                margin-left: 10px;
            }
            input[type="reset"]:hover {
                background-color: #c0392b;
            }
            .error-container {
                background-color: #fff0f0;
                border-left: 4px solid #e74c3c;
                padding: 20px;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            .error-container h1 {
                color: #e74c3c;
                margin-top: 0;
            }
            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }
            .back-link:hover {
                text-decoration: underline;
            }
            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }
                .button-group {
                    flex-direction: column;
                }
                input[type="submit"], input[type="reset"] {
                    margin: 5px 0;
                }
            }
            .upload-container {
                margin-top: 10px;
            }
            .file-info {
                margin-top: 8px;
                font-size: 14px;
            }
            .progress-bar-container {
                width: 100%;
                height: 8px;
                background-color: #ddd;
                border-radius: 4px;
                overflow: hidden;
                margin-top: 10px;
            }
            .progress-bar {
                height: 100%;
                width: 0%;
                background-color: #3498db;
                transition: width 0.3s;
            }
            .image-preview img {
                margin-top: 10px;
                max-width: 100%;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="page-content">
            <% if (AuthUtils.isAdmin(session)) {
                BookDTO book = (BookDTO) request.getAttribute("book");
                if (book == null) {
                    book = new BookDTO();
                }
                String success = (String) request.getAttribute("success");
                String error = (String) request.getAttribute("error");
                String txtBookID_error = (String) request.getAttribute("txtBookID_error");
                String txtTitle_error = (String) request.getAttribute("txtTitle_error");
                String txtAuthor_error = (String) request.getAttribute("txtAuthor_error");
                String txtPublishYear_error = (String) request.getAttribute("txtPublishYear_error");
                String txtPrice_error = (String) request.getAttribute("txtPrice_error");
                String txtQuantity_error = (String) request.getAttribute("txtQuantity_error");
                String txtImage_error = (String) request.getAttribute("txtImage_error");
            %>
            <div class="form-container">
                <h1>Book Information</h1>
                <% if (success != null) { %>
                <div class="success-message"><%= success %></div>
                <% } %>
                <% if (error != null) { %>
                <div class="error-container"><p><%= error %></p></div>
                        <% } %>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="<%= (book.getBookID() == null || book.getBookID().isEmpty()) ? "add" : "update" %>"/>
                    <div class="form-group">
                        <label for="txtBookID">Book ID:</label>
                        <input type="text" id="txtBookID" name="txtBookID" value="<%= book.getBookID() %>" <%= (book.getBookID() != null && !book.getBookID().isEmpty()) ? "readonly" : "" %>/>
                        <% if (txtBookID_error != null) { %>
                        <div class="error-message"><%= txtBookID_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtTitle">Title:</label>
                        <input type="text" id="txtTitle" name="txtTitle" value="<%= book.getTitle() %>"/>
                        <% if (txtTitle_error != null) { %>
                        <div class="error-message"><%= txtTitle_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtAuthor">Author:</label>
                        <input type="text" id="txtAuthor" name="txtAuthor" value="<%= book.getAuthor() %>"/>
                        <% if (txtAuthor_error != null) { %>
                        <div class="error-message"><%= txtAuthor_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtPublishYear">Publish Year:</label>
                        <input type="number" id="txtPublishYear" name="txtPublishYear" value="<%= book.getPublishYear() %>"/>
                        <% if (txtPublishYear_error != null) { %>
                        <div class="error-message"><%= txtPublishYear_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <input type="number" id="txtPrice" name="txtPrice" step="0.01" value="<%= book.getPrice() %>"/>
                        <% if (txtPrice_error != null) { %>
                        <div class="error-message"><%= txtPrice_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtQuantity">Quantity:</label>
                        <input type="number" id="txtQuantity" name="txtQuantity" value="<%= book.getQuantity() %>"/>
                        <% if (txtQuantity_error != null) { %>
                        <div class="error-message"><%= txtQuantity_error %></div>
                        <% } %>
                    </div>
                    <div class="form-group">
                        <label for="txtImage">Book Cover Image:</label>
                        <input type="hidden" id="txtImage" name="txtImage" value="<%= book.getImg() != null ? book.getImg() : "" %>"/>

                        <div class="upload-container">
                            <div class="file-upload-wrapper">
                                <button type="button" class="file-upload-button">Choose an Image</button>
                                <input type="file" id="imageUpload" class="file-upload-input" accept="image/*"/>
                            </div>
                            <div class="file-info" id="fileInfo">No file selected</div>
                            <div class="progress-bar-container" id="progressContainer">
                                <div class="progress-bar" id="progressBar"></div>
                            </div>
                        </div>
                        <% if (txtImage_error != null) { %>
                        <div class="error-message"><%= txtImage_error %></div>
                        <% } %>
                        <div class="image-preview" id="imagePreview">
                            <% if (book.getImg() != null && !book.getImg().isEmpty()) { %>
                            <img src="<%= book.getImg() %>" alt="<%= book.getTitle() %>"/>
                            <% } %>
                        </div>
                    </div>
                    <div class="button-group">
                        <input type="submit" value="Save"/>
                        <input type="reset" value="Reset" id="resetBtn"/>
                    </div>
                </form>
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <% } else { %>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <% } %>
        </div>
        <jsp:include page="footer.jsp"/>

             <!-- Thêm jQuery từ CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <script>
            $(document).ready(function() {
                // Hiển thị tên file khi chọn file
                $('#imageUpload').change(function() {
                    const file = this.files[0];
                    if (file) {
                        // Kiểm tra xem file có phải là hình ảnh không
                        if (!file.type.match('image.*')) {
                            alert('Please select an image file (JPEG, PNG, GIF, etc.)');
                            this.value = '';
                            $('#fileInfo').text('No file selected');
                            return;
                        }
                        
                        // Hiển thị tên file và kích thước
                        const fileSize = (file.size / 1024).toFixed(2) + ' KB';
                        $('#fileInfo').text(file.name + ' (' + fileSize + ')');
                        
                        // Hiển thị thanh tiến trình và bắt đầu chuyển đổi sang Base64
                        $('#progressContainer').show();
                        
                        // Thiết lập FileReader để đọc file và chuyển đổi sang Base64
                        const reader = new FileReader();
                        
                        reader.onprogress = function(event) {
                            if (event.lengthComputable) {
                                const percentLoaded = Math.round((event.loaded / event.total) * 100);
                                $('#progressBar').css('width', percentLoaded + '%');
                            }
                        };
                        
                        reader.onload = function(e) {
                            // Hoàn thành tiến trình
                            $('#progressBar').css('width', '100%');
                            
                            // Lưu trữ dữ liệu Base64 vào input ẩn
                            const base64String = e.target.result;
                            $('#txtImage').val(base64String);
                            
                            // Hiển thị hình ảnh xem trước
                            $('#imagePreview').html('<img src="' + base64String + '" alt="Preview">');
                            
                            // Ẩn thanh tiến trình sau 1 giây
                            setTimeout(function() {
                                $('#progressContainer').hide();
                                $('#progressBar').css('width', '0%');
                            }, 1000);
                        };
                        
                        reader.onerror = function() {
                            alert('Error reading the file. Please try again.');
                            $('#progressContainer').hide();
                            $('#progressBar').css('width', '0%');
                            $('#fileInfo').text('No file selected');
                        };
                        
                        // Bắt đầu đọc file và chuyển đổi sang Base64
                        reader.readAsDataURL(file);
                    } else {
                        $('#fileInfo').text('No file selected');
                    }
                });
                
                // Xử lý nút Reset
                $('#resetBtn').click(function() {
                    $('#imagePreview').empty();
                    $('#fileInfo').text('No file selected');
                    $('#txtImage').val('');
                    $('#progressContainer').hide();
                    $('#progressBar').css('width', '0%');
                });
                
                  // Để chọn lại file đã tải lên trước đó (nếu có)
                const existingImageSrc = $('#imagePreview img').attr('src');
                if (existingImageSrc) {
                    $('#txtImage').val(existingImageSrc);
                }
            });
        </script>
    </body>
</html>