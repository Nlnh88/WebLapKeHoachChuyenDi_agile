<?php $currentPath = trim(parse_url($_SERVER['REQUEST_URI'] ?? '', PHP_URL_PATH), '/'); ?>
<header class="topbar">
  <div class="topbar-left">
    <button class="icon-btn sidebar-toggle d-lg-none" type="button" aria-label="Mở menu" onclick="document.body.classList.toggle('sidebar-open')">☰</button>
    <a class="brand" href="<?= base_url('index.php') ?>"><span class="brand-mark">T</span><span>Trip<span>Mate</span></span></a>
  </div>
  <form class="top-search" action="<?= base_url('locations/index.php') ?>" method="get">
    <span>⌕</span>
    <input name="q" placeholder="Điểm đến, địa điểm, thành phố..." aria-label="Tìm kiếm">
    <button aria-label="Tìm kiếm">🔍</button>
  </form>
  <div class="top-actions">
    <a class="top-link d-none d-xl-inline" href="<?= base_url('locations/index.php') ?>">Khám phá</a>
    <a class="top-link d-none d-xl-inline" href="#">Trợ giúp</a>
    <span class="currency-pill d-none d-md-inline">🇻🇳 VND</span>
    <?php if ($currentUser): ?>
      <div class="dropdown">
        <button class="profile-chip dropdown-toggle" data-bs-toggle="dropdown"><span class="avatar">👤</span><?= e($currentUser['name']) ?></button>
        <ul class="dropdown-menu dropdown-menu-end shadow border-0">
          <li><a class="dropdown-item" href="<?= base_url('user/dashboard.php') ?>">Dashboard</a></li>
          <li><a class="dropdown-item" href="<?= base_url('user/trips.php') ?>">Chuyến đi của tôi</a></li>
          <?php if ($isAdmin): ?><li><a class="dropdown-item" href="<?= base_url('admin/dashboard.php') ?>">Quản trị</a></li><?php endif; ?>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item text-danger" href="<?= base_url('logout.php') ?>">Đăng xuất</a></li>
        </ul>
      </div>
    <?php else: ?>
      <a class="top-login" href="<?= base_url('login.php') ?>">Đăng nhập</a>
      <a class="btn btn-primary btn-sm rounded-3 px-3" href="<?= base_url('register.php') ?>">Đăng ký</a>
    <?php endif; ?>
  </div>
</header>

<aside class="sidebar">
  <div class="sidebar-section">
    <div class="sidebar-title">TRIPMATE</div>
    <a class="side-link" href="<?= base_url('index.php') ?>"><span>⌂</span>Trang chủ</a>
    <a class="side-link" href="<?= base_url('locations/index.php') ?>"><span>⌕</span>Khám phá địa điểm</a>
  </div>
  <?php if ($currentUser): ?>
  <div class="sidebar-section">
    <div class="sidebar-title">CHUYẾN ĐI CỦA TÔI</div>
    <a class="side-link" href="<?= base_url('user/dashboard.php') ?>"><span>◫</span>Dashboard</a>
    <a class="side-link" href="<?= base_url('user/trips.php') ?>"><span>▤</span>Danh sách chuyến đi</a>
    <a class="side-link" href="<?= base_url('user/public-trips.php') ?>"><span>✈</span>Chuyến đi cộng đồng</a>
    <a class="side-link side-link-primary" href="<?= base_url('user/trip-create.php') ?>"><span>＋</span>Tạo chuyến đi</a>
  </div>
  <div class="sidebar-section">
    <div class="sidebar-title">CÁ NHÂN</div>
    <a class="side-link" href="<?= base_url('user/favorites.php') ?>"><span>♡</span>Địa điểm đã lưu</a>
  </div>
  <?php if ($isAdmin): ?>
  <div class="sidebar-section">
    <div class="sidebar-title">QUẢN TRỊ</div>
    <a class="side-link" href="<?= base_url('admin/dashboard.php') ?>"><span>▦</span>Admin Dashboard</a>
    <a class="side-link" href="<?= base_url('admin/users.php') ?>"><span>♙</span>Người dùng</a>
    <a class="side-link" href="<?= base_url('admin/locations.php') ?>"><span>⌖</span>Địa điểm</a>
  </div>
  <?php endif; ?>
  <?php endif; ?>
  <div class="sidebar-bottom">
    <div class="side-help"><div class="side-help-icon">✦</div><div><strong>TripMate Tips</strong><small>Lên lịch trước để chuyến đi nhẹ đầu hơn.</small></div></div>
  </div>
</aside>
<div class="sidebar-overlay d-lg-none" onclick="document.body.classList.remove('sidebar-open')"></div>
