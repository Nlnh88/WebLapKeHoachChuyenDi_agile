<?php
session_start(); require __DIR__.'/../config/database.php'; require __DIR__.'/../includes/helpers.php'; require_login();
$uid=$_SESSION['user']['id'];
$st=$pdo->prepare('SELECT f.id favorite_id,l.*,c.name category_name,COALESCE(ROUND(AVG(r.rating),1),l.rating) AS display_rating FROM favorites f JOIN locations l ON l.id=f.location_id JOIN categories c ON c.id=l.category_id LEFT JOIN reviews r ON r.location_id=l.id WHERE f.user_id=? GROUP BY f.id,l.id,c.name ORDER BY f.created_at DESC');
$st->execute([$uid]); $locations=$st->fetchAll();
$pageTitle='Địa điểm đã lưu'; include __DIR__.'/../includes/header.php'; show_flash();
?>
<div class="page-shell"><div class="d-flex justify-content-between align-items-end gap-3 mb-4"><div><div class="eyebrow">SAVED PLACES</div><h1 class="page-title">Địa điểm đã lưu</h1><div class="subtext mt-1">Danh sách những nơi bạn muốn ghé trong các chuyến đi sắp tới.</div></div><a class="btn btn-primary rounded-3" href="<?= base_url('locations/index.php') ?>">Khám phá thêm</a></div>
<div class="location-grid">
<?php foreach($locations as $l): ?><article class="location-card"><div class="thumb-wrap"><img src="<?= e($l['image_url']) ?>" alt="<?= e($l['name']) ?>"><button type="button" class="heart-btn js-favorite position-absolute top-0 end-0 m-2 is-favorite" data-location-id="<?= (int)$l['id'] ?>" data-remove-on-unsave="1" title="Bỏ lưu" aria-label="Bỏ yêu thích" aria-pressed="true">♥</button></div><div class="location-body"><span class="pill"><?= e($l['category_name']) ?></span><h3><?= e($l['name']) ?></h3><div class="meta-line">📍 <?= e($l['address']) ?></div><div class="price-row"><span class="rating">★ <?= e($l['display_rating']) ?></span><span class="price"><?= number_format($l['average_cost'],0,',','.') ?>đ</span></div><a class="btn btn-sm btn-dark w-100 mt-3 rounded-3" href="<?= base_url('locations/detail.php?id='.$l['id']) ?>">Xem chi tiết</a></div></article><?php endforeach; ?>
<?php if(!$locations): ?><div class="col-12"><div class="empty-state">Bạn chưa lưu địa điểm nào.</div></div><?php endif; ?></div></div>
<?php include __DIR__.'/../includes/footer.php'; ?>
