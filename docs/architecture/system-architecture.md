# System Architecture – TripMate

## 1. System Overview

TripMate là website hỗ trợ người dùng tìm kiếm địa điểm du lịch
và lập kế hoạch chuyến đi tại Việt Nam.

Hệ thống được xây dựng theo mô hình ứng dụng web sử dụng PHP,
MySQL và XAMPP.

## 2. Technology Stack

| Thành phần | Công nghệ |
|---|---|
| Frontend | HTML, CSS, JavaScript, Bootstrap |
| Backend | PHP |
| Database | MySQL |
| Web Server | Apache |
| Development Environment | XAMPP |
| Version Control | Git / GitHub |

## 3. Architecture Model

Hệ thống được tổ chức theo mô hình Web Application gồm các thành phần:

```text
+----------------------+
|       User/Admin     |
+----------+-----------+
           |
           v
+----------------------+
|     Web Interface    |
| HTML/CSS/JS/Bootstrap|
+----------+-----------+
           |
           v
+----------------------+
|      PHP Backend     |
| Business Logic       |
+----------+-----------+
           |
           v
+----------------------+
|      MySQL Database  |
+----------------------+