<?php
session_start();
require __DIR__.'/../config/database.php';
require __DIR__.'/../includes/helpers.php';

$isAjax = strtolower($_SERVER['HTTP_X_REQUESTED_WITH'] ?? '') === 'xmlhttprequest';

if (empty($_SESSION['user'])) {
    if ($isAjax) {
        http_response_code(401);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['ok'=>false,'need_login'=>true,'message'=>'Vui lòng đăng nhập để lưu địa điểm.'], JSON_UNESCAPED_UNICODE);
        exit;
    }
    flash('warning','Vui lòng đăng nhập để lưu địa điểm.');
    redirect('login.php');
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); exit('Method Not Allowed');
}

verify_csrf();
$uid = (int)$_SESSION['user']['id'];
$loc = (int)($_POST['location_id'] ?? 0);

$check = $pdo->prepare('SELECT id FROM locations WHERE id=?');
$check->execute([$loc]);
if (!$check->fetchColumn()) {
    if ($isAjax) {
        http_response_code(404);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['ok'=>false,'message'=>'Địa điểm không tồn tại.'], JSON_UNESCAPED_UNICODE);
        exit;
    }
    flash('danger','Địa điểm không tồn tại.');
    redirect('locations/index.php');
}

$st = $pdo->prepare('SELECT id FROM favorites WHERE user_id=? AND location_id=?');
$st->execute([$uid,$loc]);
if ($row = $st->fetch()) {
    $pdo->prepare('DELETE FROM favorites WHERE id=?')->execute([$row['id']]);
    $saved = false;
    $message = 'Đã bỏ địa điểm khỏi yêu thích.';
} else {
    $pdo->prepare('INSERT INTO favorites(user_id,location_id) VALUES(?,?)')->execute([$uid,$loc]);
    $saved = true;
    $message = 'Đã lưu địa điểm vào yêu thích.';
}

if ($isAjax) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['ok'=>true,'saved'=>$saved,'message'=>$message], JSON_UNESCAPED_UNICODE);
    exit;
}

flash($saved ? 'success' : 'info',$message);
$back = $_SERVER['HTTP_REFERER'] ?? base_url('locations/index.php');
header('Location: '.$back); exit;
