USE tripmate;

SET @has_destination = (
  SELECT COUNT(*) FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'locations' AND COLUMN_NAME = 'destination'
);
SET @sql = IF(@has_destination = 0,
  'ALTER TABLE locations ADD COLUMN destination VARCHAR(150) NULL AFTER image_url',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

UPDATE locations SET destination = CASE name
  WHEN 'Đà Lạt' THEN 'Đà Lạt'
  WHEN 'Kỳ Co' THEN 'Quy Nhơn'
  WHEN 'Tà Xùa' THEN 'Tà Xùa'
  WHEN 'Đà Nẵng' THEN 'Đà Nẵng'
  WHEN 'Phong Nha' THEN 'Phong Nha'
  WHEN 'Huế' THEN 'Huế'
  WHEN 'Phú Yên' THEN 'Phú Yên'
  WHEN 'Sa Pa' THEN 'Sa Pa'
  WHEN 'Đồi chè Cầu Đất' THEN 'Đà Lạt'
  WHEN 'Hồ Xuân Hương' THEN 'Đà Lạt'
  WHEN 'Quảng trường Lâm Viên' THEN 'Đà Lạt'
  WHEN 'Thung lũng Tình Yêu' THEN 'Đà Lạt'
  WHEN 'Dinh Bảo Đại' THEN 'Đà Lạt'
  ELSE destination
END;


-- Nếu bạn có các địa điểm Đà Lạt được thêm trước đó, chỉ cần cập nhật destination='Đà Lạt' cho chúng.
