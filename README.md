# TripMate — Core MVP cho nhóm 3 người / chạy trước bởi 1 người

TripMate là website lập kế hoạch chuyến đi theo phong cách travel portal hiện đại: header, sidebar trái, hero search, inspiration cards, destination grid và trip workspace.

## Mục tiêu 1 tuần
Làm **10 tính năng lõi chạy end-to-end trước**. Chức năng mở rộng chỉ thêm khi core đã ổn.

### 10 tính năng lõi
1. **Auth** — đăng ký, đăng nhập, đăng xuất, session, password hash.
2. **Explore locations** — list/grid, search, filter, sort, pagination.
3. **Location detail** — chi tiết địa điểm + rating/review.
4. **Favorites** — lưu/bỏ lưu địa điểm.
5. **Trip CRUD** — tạo, xem, sửa, xóa chuyến đi.
6. **Itinerary** — thêm/xóa hoạt động theo ngày/giờ.
7. **Budget** — thêm/xóa khoản chi + tổng ngân sách.
8. **Checklist** — thêm, tick hoàn thành, xóa.
9. **Members & registration** — thêm thành viên + đăng ký tham gia trip public.
10. **Admin** — dashboard, quản lý users, locations, trips, registrations.

## Stack
- PHP 8+
- MySQL 8+
- Bootstrap 5
- Vanilla JavaScript
- Chart.js để mở rộng sau

## Database
`users`, `categories`, `locations`, `trips`, `trip_members`, `itineraries`, `expenses`, `favorites`, `registrations`, `reviews`, `checklists`

## Cấu trúc
```text
TripMate/
├── actions/
├── admin/
├── assets/
├── config/
├── database/
├── includes/
├── locations/
├── user/
└── index.php
```

## Chạy local
1. Copy thư mục vào `C:/xampp/htdocs/TripMate`.
2. Start Apache + MySQL.
3. phpMyAdmin → Import `database/tripmate.sql`.
4. Mở `http://localhost/TripMate/`.

## Demo accounts
- Admin: `admin@tripmate.local` / `Admin@123`
- User: `demo@tripmate.local` / `Admin@123`

## Chiến thuật làm
**UI → PHP → SQL → Test → Commit** theo từng module. Không để ngày cuối mới tích hợp.

### P0 trước
Auth → Locations → Trip CRUD → Itinerary → Admin.

### P1 sau khi P0 ổn
Budget → Favorite → Checklist → Registration → Review.

### P2 nếu còn thời gian
Email → notification → chart → map → weather.

## Phân công khi đủ 3 người
- **TV1:** Frontend / UI / responsive.
- **TV2:** Backend PHP / Auth / Trip / Itinerary / Registration.
- **TV3:** SQL / Admin / Budget / Favorite / Checklist / Review / Testing.

Khi chỉ có 1 người, vẫn giữ nguyên 3 module trên nhưng làm tuần tự theo P0 → P1; mục tiêu là một người có thể chạy được toàn bộ core trước.


## Điểm đến theo chuyến đi
- Khi tạo/chỉnh sửa trip, Điểm đến là dropdown lấy từ dữ liệu locations.
- Lịch trình chỉ cho chọn locations có cùng `destination` với trip.
- `database/patch_destinations.sql` dùng để cập nhật database cũ mà không cần xóa dữ liệu.
