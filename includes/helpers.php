<?php
function base_url(string $path = ''): string {
    $projectRoot = '/webchuyendi';
    return $projectRoot . '/' . ltrim($path, '/');
}
function redirect(string $path): never { header('Location: ' . base_url($path)); exit; }
function flash(string $type, string $message): void { $_SESSION['flash'] = ['type'=>$type,'message'=>$message]; }
function show_flash(): void {
    if (!empty($_SESSION['flash'])) {
        $f = $_SESSION['flash']; unset($_SESSION['flash']);
        echo '<div class="alert alert-'.htmlspecialchars($f['type']).' mt-3">'.htmlspecialchars($f['message']).'</div>';
    }
}
function require_login(): void { if (empty($_SESSION['user'])) { flash('warning','Vui lòng đăng nhập để tiếp tục.'); redirect('login.php'); } }
function require_admin(): void { require_login(); if (($_SESSION['user']['role'] ?? '') !== 'admin') { http_response_code(403); exit('403 - Access denied'); } }
function e($v): string { return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); }
function csrf_token(): string { if(empty($_SESSION['csrf'])) $_SESSION['csrf']=bin2hex(random_bytes(24)); return $_SESSION['csrf']; }
function verify_csrf(): void { if(!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) { http_response_code(419); exit('Invalid CSRF token'); } }
function old_or(string $key, string $default=''): string { return e($_POST[$key] ?? $default); }
