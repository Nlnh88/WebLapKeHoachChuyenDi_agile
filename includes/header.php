<?php
if (session_status() === PHP_SESSION_NONE) session_start();
$pageTitle = $pageTitle ?? 'TripMate';
$currentUser = $_SESSION['user'] ?? null;
$isAdmin = $currentUser && ($currentUser['role'] ?? '') === 'admin';
?>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#2563eb">
    <meta name="csrf-token" content="<?= e(csrf_token()) ?>">
    <script>window.TRIPMATE_BASE=<?= json_encode(rtrim(base_url(),'/')) ?>; window.TRIPMATE_FAVORITE_URL=<?= json_encode(base_url('actions/favorite.php')) ?>;</script>
    <title><?= htmlspecialchars($pageTitle) ?> | TripMate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css') ?>">
</head>
<body>
<?php include __DIR__ . '/navbar.php'; ?>
<main class="page-main">
