# TripMate – Vietnam Travel Planning Website

TripMate là website hỗ trợ người dùng khám phá các địa điểm du lịch tại Việt Nam và lập kế hoạch cho chuyến đi.

Project được xây dựng bằng PHP và MySQL, chạy trên môi trường XAMPP. Dự án được phát triển theo phương pháp Agile/Scrum với 2 Sprint trong thời gian từ 01/09/2026 đến 14/09/2026.

## 1. Mục tiêu dự án

TripMate hướng đến việc cung cấp một nền tảng đơn giản để người dùng:

- Khám phá các địa điểm du lịch.
- Tìm kiếm và lọc địa điểm.
- Xem thông tin chi tiết địa điểm.
- Lưu địa điểm yêu thích.
- Tạo và quản lý chuyến đi.
- Xây dựng lịch trình theo ngày.
- Quản lý thành viên chuyến đi.
- Đăng ký tham gia các chuyến đi công khai.
- Quản lý ngân sách và checklist.
- Đánh giá địa điểm.

Hệ thống cũng cung cấp khu vực Admin để quản lý người dùng, địa điểm, chuyến đi và đăng ký tham gia.

## 2. Chức năng chính

### Người dùng

1. Đăng ký tài khoản.
2. Đăng nhập / đăng xuất.
3. Xem danh sách địa điểm.
4. Tìm kiếm và lọc địa điểm.
5. Xem chi tiết địa điểm.
6. Lưu / bỏ lưu địa điểm yêu thích.
7. Tạo chuyến đi.
8. Xem, sửa và xóa chuyến đi.
9. Xây dựng lịch trình theo ngày.
10. Quản lý thành viên chuyến đi.
11. Quản lý ngân sách.
12. Quản lý checklist.
13. Xem và đăng ký tham gia chuyến đi công khai.
14. Viết và xem đánh giá.

### Admin

- Dashboard quản trị.
- Quản lý người dùng.
- Quản lý địa điểm.
- Quản lý chuyến đi.
- Quản lý đăng ký tham gia.
- Phân quyền người dùng.

## 3. Công nghệ sử dụng

- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Backend:** PHP
- **Database:** MySQL
- **Web Server:** Apache
- **Local Development:** XAMPP
- **Version Control:** Git / GitHub

## 4. Cấu trúc project

```text
webchuyendi/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   └── bug_report.md
│   └── PULL_REQUEST_TEMPLATE.md
│
├── actions/
│   └── favorite.php
│
├── admin/
│   ├── dashboard.php
│   ├── locations.php
│   ├── registrations.php
│   ├── trips.php
│   └── users.php
│
├── assets/
│   ├── css/
│   └── js/
│
├── config/
│   └── database.php
│
├── database/
│   ├── tripmate.sql
│   ├── patch_cp06.sql
│   └── patch_destinations.sql
│
├── docs/
│   ├── agile/
│   │   ├── product-backlog.md
│   │   ├── sprint-1/
│   │   └── sprint-2/
│   │
│   └── architecture/
│       ├── system-architecture.md
│       └── database-architecture.md
│
├── includes/
│   ├── footer.php
│   ├── header.php
│   ├── helpers.php
│   └── navbar.php
│
├── locations/
│   ├── detail.php
│   └── index.php
│
├── uploads/
│   └── reviews/
│
├── user/
│   ├── dashboard.php
│   ├── favorites.php
│   ├── public-trips.php
│   ├── trip-create.php
│   ├── trip-detail.php
│   ├── trip-edit.php
│   └── trips.php
│
├── index.php
├── login.php
├── logout.php
├── register.php
├── .gitignore
└── README.md