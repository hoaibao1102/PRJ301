<%-- 
    Document   : footer
    Created on : May 6, 2025, 1:02:13 PM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Arial, sans-serif;
            }

            /* FOOTER */
            .footer {
                background-color: #333;
                color: #fff;
                padding: 40px 20px;
                margin-top: 50px;
            }

            .footer-container {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                max-width: 1000px;
                margin: 0 auto;
            }

            .footer-column {
                flex: 1;
                min-width: 250px;
                margin: 10px;
            }

            .footer-column h3 {
                margin-bottom: 15px;
                font-size: 18px;
                color: #ffcc00;
            }

            .footer-column p {
                margin: 5px 0;
            }

            .social-media a {
                margin-right: 10px;
                display: inline-block;
            }

            .social-media img {
                width: 30px;
                height: 30px;
                transition: transform 0.3s ease;
            }

            .social-media img:hover {
                transform: scale(1.2);
            }
        </style>
    </head>
    <body>
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-column contact-info">
                    <h3>Thông tin liên hệ</h3>
                    <p>Công ty TNHH ABC</p>
                    <p>Địa chỉ: 123 Đường ABC, TP.HCM</p>
                    <p>Email: lienhe@abc.vn</p>
                    <p>Điện thoại: 0909 123 456</p>
                </div>

                <div class="footer-column social-media">
                    <h3>Kết nối với chúng tôi</h3>
                    <a href="#"><img src="facebook.png" alt="Facebook"></a>
                    <a href="#"><img src="youtube.png" alt="YouTube"></a>
                    <a href="#"><img src="instagram.png" alt="Instagram"></a>
                </div>
            </div>
        </footer>
    </body>
</html>
