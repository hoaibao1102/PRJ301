-- Tạo database
CREATE DATABASE IF NOT EXISTS tour_booking;
USE tour_booking;

-- Bảng người dùng
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(50) DEFAULT 'user'
);

-- Dữ liệu mẫu người dùng
INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@example.com', 'admin123', 'admin'),
('Nguyen Van A', 'nva@example.com', 'user123', 'user');

-- Bảng địa điểm
CREATE TABLE locations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    image VARCHAR(255)
);

-- Dữ liệu địa điểm
INSERT INTO locations (name) VALUES
('Hạ Long'), ('Sa Pa'), ('Hội An'), ('Đà Nẵng'), ('Nha Trang'),
('Đà Lạt'), ('Phú Quốc'), ('Huế'), ('Hà Nội'), ('TP. Hồ Chí Minh');

-- Bảng tour
CREATE TABLE tours (
    id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2),
    duration VARCHAR(50),
    image VARCHAR(255),
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

-- Dữ liệu tour
INSERT INTO tours (location_id, name, price, duration) VALUES
(1, 'Tour Hạ Long #1', 3000000, '3 ngày 2 đêm'),
(1, 'Tour Hạ Long #2', 2500000, '2 ngày 1 đêm'),
(2, 'Tour Sa Pa #1', 2500000, '4 ngày 3 đêm'),
(2, 'Tour Sa Pa #2', 2000000, '3 ngày 2 đêm'),
(3, 'Tour Hội An #1', 1500000, '2 ngày 1 đêm'),
(3, 'Tour Hội An #2', 2000000, '3 ngày 2 đêm'),
(4, 'Tour Đà Nẵng #1', 2000000, '2 ngày 1 đêm'),
(4, 'Tour Đà Nẵng #2', 2500000, '3 ngày 2 đêm'),
(5, 'Tour Nha Trang #1', 3000000, '3 ngày 2 đêm'),
(5, 'Tour Nha Trang #2', 2500000, '2 ngày 1 đêm'),
(6, 'Tour Đà Lạt #1', 1500000, '2 ngày 1 đêm'),
(6, 'Tour Đà Lạt #2', 2000000, '3 ngày 2 đêm'),
(7, 'Tour Phú Quốc #1', 3000000, '3 ngày 2 đêm'),
(7, 'Tour Phú Quốc #2', 2500000, '2 ngày 1 đêm'),
(8, 'Tour Huế #1', 2500000, '3 ngày 2 đêm'),
(8, 'Tour Huế #2', 1500000, '2 ngày 1 đêm'),
(9, 'Tour Hà Nội #1', 2000000, '3 ngày 2 đêm'),
(9, 'Tour Hà Nội #2', 1500000, '2 ngày 1 đêm'),
(10, 'Tour TP. Hồ Chí Minh #1', 2500000, '3 ngày 2 đêm'),
(10, 'Tour TP. Hồ Chí Minh #2', 3000000, '4 ngày 3 đêm');

-- Bảng đơn đặt tour
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tour_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending',
    note TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (tour_id) REFERENCES tours(id)
);

-- Dữ liệu booking
INSERT INTO bookings (user_id, tour_id, status) VALUES
(2, 3, 'pending'),
(2, 8, 'completed');
