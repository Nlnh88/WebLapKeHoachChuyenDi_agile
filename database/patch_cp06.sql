USE tripmate;

-- CP06: mỗi user chỉ có 1 đánh giá cho 1 địa điểm.
-- Xóa các review trùng cũ, giữ lại review có id nhỏ nhất trước khi tạo UNIQUE.
DELETE r1 FROM reviews r1
JOIN reviews r2
  ON r1.user_id = r2.user_id
 AND r1.location_id = r2.location_id
 AND r1.id > r2.id;

ALTER TABLE reviews
  ADD UNIQUE KEY uq_review_user_location(user_id, location_id);

CREATE TABLE IF NOT EXISTS review_images (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  review_id INT UNSIGNED NOT NULL,
  image_path VARCHAR(500) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (review_id) REFERENCES reviews(id) ON UPDATE CASCADE ON DELETE CASCADE,
  INDEX idx_review_images_review(review_id)
) ENGINE=InnoDB;
