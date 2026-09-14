# TripMate — CP06 Favorite + Review

CP06 hoàn thiện 2 chức năng: địa điểm yêu thích và đánh giá địa điểm.

## Đã làm
- Tim trên card hoạt động trực tiếp bằng AJAX, không mở trang chi tiết.
- Tim đổi `♡` ↔ `♥` và giữ trạng thái sau khi reload.
- Trang `user/favorites.php` hiển thị các địa điểm đã lưu.
- Khách chưa đăng nhập bấm tim/đánh giá sẽ nhận hộp thoại yêu cầu đăng nhập, không bị chuyển trang ngay.
- Review có số sao, nội dung, ngày/giờ `dd/mm/YYYY HH:mm`.
- Review cho upload tối đa 5 ảnh, JPG/PNG/WEBP, mỗi ảnh tối đa 5MB.
- Mỗi user chỉ có 1 review cho 1 địa điểm; có thể sửa/xóa review của mình.
- Rating hiển thị trên card/detail được tính từ review nếu địa điểm đã có review; nếu chưa có review thì dùng rating gốc.
- Ảnh review lưu tại `uploads/reviews/`.

## Cập nhật database
Nếu database `tripmate` hiện tại đã có dữ liệu, import:
`database/patch_cp06.sql`

Nếu cài database mới từ đầu, dùng `database/tripmate.sql` (đã bao gồm `checklist_progress` của CP05 và `review_images` của CP06).

## Test CP06
1. Logout → vào Khám phá → bấm tim: modal yêu cầu đăng nhập.
2. Login → bấm tim Phú Yên: tim thành `♥`, không chuyển trang.
3. Vào Địa điểm đã lưu: Phú Yên xuất hiện.
4. Bấm tim lại: bỏ lưu và biến mất khỏi danh sách đã lưu.
5. Vào chi tiết một địa điểm → chưa login: khu đánh giá có nút yêu cầu đăng nhập.
6. Login → đăng review + chọn nhiều ảnh → kiểm tra ngày/giờ và gallery.
7. Cùng user mở lại: thấy review của mình và nút cập nhật/xóa.
8. Thử review lần 2: hệ thống không tạo review trùng.
