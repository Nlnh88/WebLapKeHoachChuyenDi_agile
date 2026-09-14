<?php
session_start(); require __DIR__.'/../config/database.php'; require __DIR__.'/../includes/helpers.php'; require_login();
$uid=$_SESSION['user']['id'];
$st=$pdo->prepare('SELECT t.*, COUNT(DISTINCT tm_all.id) member_count, COALESCE((SELECT SUM(e2.amount) FROM expenses e2 WHERE e2.trip_id=t.id),0) spent, CASE WHEN t.owner_id=? THEN 1 ELSE 0 END is_owner FROM trips t JOIN trip_members tm_me ON tm_me.trip_id=t.id AND tm_me.user_id=? LEFT JOIN trip_members tm_all ON tm_all.trip_id=t.id WHERE t.owner_id=? OR tm_me.user_id=? GROUP BY t.id ORDER BY t.start_date DESC LIMIT 6');$st->execute([$uid,$uid,$uid,$uid]);$trips=$st->fetchAll();
$st=$pdo->prepare('SELECT COUNT(*) FROM favorites WHERE user_id=?');$st->execute([$uid]);$favCount=(int)$st->fetchColumn();
$st=$pdo->prepare('SELECT COUNT(*) FROM registrations WHERE user_id=?');$st->execute([$uid]);$regCount=(int)$st->fetchColumn();
$st=$pdo->prepare('SELECT COUNT(DISTINCT t.id) FROM trips t JOIN trip_members tm ON tm.trip_id=t.id WHERE tm.user_id=?');$st->execute([$uid]);$tripCount=(int)$st->fetchColumn();
$pageTitle='Dashboard'; include __DIR__.'/../includes/header.php'; show_flash();
?>
<div class="page-shell">
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-4"><div><div class="eyebrow">MY TRIPSPACE</div><h1 class="page-title">Xin chào, <?= e($_SESSION['user']['name']) ?> 👋</h1><div class="subtext mt-1">Một chỗ để bạn lên lịch, theo dõi ngân sách, chuẩn bị cho ngày khởi hành và xem các chuyến đi được chia sẻ cùng bạn.</div></div><a href="<?= base_url('user/trip-create.php') ?>" class="btn btn-primary rounded-3 px-4">＋ Tạo chuyến đi</a></div>
  <div class="row g-3 mb-4">
    <div class="col-6 col-lg-3"><div class="stat-card"><div class="stat-icon">◫</div><div class="stat-label mt-3">Tổng chuyến đi</div><div class="stat-value"><?= $tripCount ?></div></div></div>
    <div class="col-6 col-lg-3"><div class="stat-card"><div class="stat-icon">♡</div><div class="stat-label mt-3">Địa điểm đã lưu</div><div class="stat-value"><?= $favCount ?></div></div></div>
    <div class="col-6 col-lg-3"><div class="stat-card"><div class="stat-icon">◎</div><div class="stat-label mt-3">Đăng ký tham gia</div><div class="stat-value"><?= $regCount ?></div></div></div>
    <div class="col-6 col-lg-3"><div class="stat-card"><div class="stat-icon">✦</div><div class="stat-label mt-3">Gợi ý hôm nay</div><div class="stat-value">3</div></div></div>
  </div>
  <div class="row g-4">
    <div class="col-lg-8"><div class="panel h-100"><div class="d-flex justify-content-between align-items-center mb-3"><div><div class="eyebrow">MY TRIPS</div><h3 class="fw-800 mb-0">Chuyến đi gần đây</h3></div><a href="<?= base_url('user/trips.php') ?>" class="section-link">Quản lý tất cả →</a></div>
      <?php if(!$trips): ?><div class="empty-state mt-3">Chưa có chuyến đi. Tạo một kế hoạch và bắt đầu thêm địa điểm.</div><?php else: ?>
      <?php foreach($trips as $t): $pct=$t['budget']>0?min(100,round(($t['spent']/$t['budget'])*100)):0; ?><div class="border rounded-3 p-3 mb-3"><div class="d-flex justify-content-between gap-3"><div><span class="pill"><?= e($t['destination']) ?></span><?php if(!(int)$t['is_owner']): ?><span class="pill ms-1">Được chia sẻ</span><?php endif; ?><h4 class="fs-6 fw-800 mt-2 mb-1"><?= e($t['name']) ?></h4><div class="subtext"><?= e($t['start_date']) ?> → <?= e($t['end_date']) ?> · 👥 <?= (int)$t['member_count'] ?></div></div><a class="btn btn-sm btn-outline-primary align-self-start" href="<?= base_url('user/trip-detail.php?id='.$t['id']) ?>">Mở</a></div><div class="d-flex justify-content-between mt-3 mb-1 small"><span>Ngân sách đã dùng</span><strong><?= $pct ?>%</strong></div><div class="metric-bar"><span style="width:<?= $pct ?>%"></span></div></div><?php endforeach; ?>
      <?php endif; ?></div></div>
    <div class="col-lg-4"><div class="panel h-100"><div class="eyebrow">QUICK START</div><h3 class="fw-800 fs-5 mt-1">Bắt đầu nhanh</h3><div class="d-grid gap-2 mt-3"><a class="btn btn-primary text-start" href="<?= base_url('user/trip-create.php') ?>">＋ Tạo lịch trình mới</a><a class="btn btn-light text-start border" href="<?= base_url('locations/index.php') ?>">⌕ Khám phá địa điểm</a><a class="btn btn-light text-start border" href="<?= base_url('user/trips.php') ?>">▤ Xem toàn bộ chuyến đi</a></div><hr><div class="eyebrow">TIP</div><p class="subtext mb-0">Chia chuyến đi theo từng ngày và thêm chi phí ngay khi phát sinh để tổng ngân sách luôn chính xác.</p></div></div>
  </div>
</div>
<?php include __DIR__.'/../includes/footer.php'; ?>
