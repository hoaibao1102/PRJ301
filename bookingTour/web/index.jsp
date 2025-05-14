<%-- 
    Document   : index
    Created on : May 15, 2025, 12:44:58 AM
    Author     : MSI PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>VN Travel Helper - Trang chủ</title>
        <style>
            /* Header cố định */
            header {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: #2c3e50;
                color: white;
                padding: 1rem 2rem;
                z-index: 1000;
                box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            }

            /* Đẩy nội dung xuống tránh bị header chèn lên */
            body {
                margin: 0;
                padding-top: 70px; /* bằng chiều cao header */
                font-family: Arial, sans-serif;
                background-color: #fafafa;
                color: #333;
            }

            /* Banner */
            .banner {
                background: url('banner.jpg') center/cover no-repeat;
                height: 300px;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2.5rem;
                font-weight: bold;
                text-shadow: 1px 1px 4px rgba(0,0,0,0.7);
            }

            /* Section chính */
            .section {
                max-width: 1200px;
                margin: 30px auto;
                padding: 0 20px;
            }

            /* Tiêu đề section */
            .title {
                font-size: 1.8rem;
                margin-bottom: 20px;
                border-left: 5px solid #3498db;
                padding-left: 15px;
                font-weight: 600;
            }

            /* Lưới card */
            .grid {
                display: flex;
                gap: 20px;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            /* Card */
            .card {
                background: #fff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                text-align: center;
                flex: 1 1 calc(25% - 20px);
                max-width: calc(25% - 20px);
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
            }

            .card img {
                width: 100%;
                height: 160px;
                object-fit: cover;
            }

            .card h4 {
                margin: 15px 0 10px 0;
                font-size: 1.2rem;
                color: #2c3e50;
                font-weight: 600;
            }

            .card a {
                text-decoration: none;
                display: block;
                padding: 10px 0;
                background: #3498db;
                color: white;
                border-radius: 0 0 10px 10px;
                font-weight: 600;
                transition: background-color 0.3s ease;
            }

            .card a:hover {
                background: #2980b9;
            }

            /* Responsive cho màn hình nhỏ */
            @media (max-width: 1024px) {
                .card {
                    flex: 1 1 calc(33.333% - 20px);
                    max-width: calc(33.333% - 20px);
                }
            }

            @media (max-width: 768px) {
                .card {
                    flex: 1 1 calc(50% - 20px);
                    max-width: calc(50% - 20px);
                }
            }

            @media (max-width: 480px) {
                .card {
                    flex: 1 1 100%;
                    max-width: 100%;
                }
            }

        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="banner">
            Khám phá Việt Nam theo cách của bạn!
        </div>

        <div class="section">
            <div class="title">Điểm đến nổi bật</div>
            <div class="grid">
                <div class="card">
                    <img src="img/danang.jpg" alt="Đà Nẵng">
                    <h4>Đà Nẵng</h4>
                    <a href="place-list.jsp?location=Đà Nẵng">Xem thêm</a>
                </div>
                <div class="card">
                    <img src="img/dalat.jpg" alt="Đà Lạt">
                    <h4>Đà Lạt</h4>
                    <a href="place-list.jsp?location=Đà Lạt">Xem thêm</a>
                </div>
                <div class="card">
                    <img src="img/vungtau.jpg" alt="Vũng Tàu">
                    <h4>Vũng Tàu</h4>
                    <a href="place-list.jsp?location=Vũng Tàu">Xem thêm</a>
                </div>
                <div class="card">
                    <img src="img/hanoi.jpg" alt="Hà Nội">
                    <h4>Hà Nội</h4>
                    <a href="place-list.jsp?location=Hà Nội">Xem thêm</a>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="title">Gợi ý ăn uống & vui chơi</div>
            <div class="grid">
                <div class="card">
                    <img src="img/banh_khot.jpg" alt="Bánh khọt Vũng Tàu">
                    <h4>Bánh khọt Gốc Vú Sữa</h4>
                    <a href="https://goo.gl/maps/Q3Q4pxAf1vZcJt4Z9" target="_blank">Xem bản đồ</a>
                </div>
                <div class="card">
                    <img src="img/ngu_hanh_son.jpg" alt="Ngũ Hành Sơn">
                    <h4>Ngũ Hành Sơn</h4>
                    <a href="https://goo.gl/maps/v2FHvN61Z69iL8DA7" target="_blank">Xem bản đồ</a>
                </div>
                <div class="card">
                    <img src="img/bun_cha_obama.jpg" alt="Bún chả Hương Liên">
                    <h4>Bún chả Hương Liên</h4>
                    <a href="https://goo.gl/maps/XUgYjpuSAv1cF5RF6" target="_blank">Xem bản đồ</a>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
