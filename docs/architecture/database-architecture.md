# Database Architecture – TripMate

## 1. Database Overview

TripMate sử dụng MySQL để lưu trữ và quản lý dữ liệu của website.

Cơ sở dữ liệu được sử dụng để quản lý thông tin người dùng,
địa điểm du lịch, chuyến đi, lịch trình, đánh giá và các dữ liệu
liên quan đến quá trình lập kế hoạch chuyến đi.

---

## 2. Database Technology

- **Database Management System:** MySQL
- **Development Environment:** XAMPP
- **Database Connection:** PHP MySQLi/PDO
- **Database Scripts:** Thư mục `database/`

---

## 3. Main Data Groups

Cơ sở dữ liệu TripMate được tổ chức thành các nhóm dữ liệu chính:

### User Data

Lưu trữ thông tin tài khoản và người dùng của hệ thống.

### Destination Data

Lưu trữ thông tin các địa điểm du lịch tại Việt Nam.

### Trip Data

Lưu trữ thông tin các chuyến đi do người dùng tạo.

### Itinerary Data

Lưu trữ lịch trình và các hoạt động trong từng chuyến đi.

### Favorite & Review Data

Lưu trữ địa điểm yêu thích và đánh giá của người dùng.

### Member Data

Lưu trữ thông tin thành viên tham gia các chuyến đi.

---

## 4. Database Relationship Overview

Mối quan hệ dữ liệu tổng quát:

```text
+-------------+
|    Users    |
+------+------+
       |
       | creates
       v
+-------------+
|    Trips    |
+------+------+
       |
       +----------------+
       |                |
       |                |
       v                v
+-------------+   +-------------+
| Itineraries |   |   Members   |
+------+------+   +-------------+
       |
       | contains
       v
+-------------+
| Destinations|
+-------------+

Users
  |
  +---- Favorites ----> Destinations
  |
  +---- Reviews -------> Destinations