<?php
session_start(); require __DIR__.'/config/database.php'; require __DIR__.'/includes/helpers.php';
if (!empty($_SESSION['user'])) redirect('user/dashboard.php');
$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
  verify_csrf(); $email=trim($_POST['email']??''); $password=$_POST['password']??'';
  $st=$pdo->prepare('SELECT * FROM users WHERE email=? LIMIT 1'); $st->execute([$email]); $u=$st->fetch();
  if($u && password_verify($password,$u['password_hash']) && $u['status']==='active') { $_SESSION['user']=['id'=>$u['id'],'name'=>$u['full_name'],'email'=>$u['email'],'role'=>$u['role']]; redirect('user/dashboard.php'); }
  $error='Email hoặc mật khẩu không đúng.';
}
$pageTitle='Đăng nhập'; include __DIR__.'/includes/header.php';
?>
<div class="auth-wrap"><div class="auth-card"><div class="text-center mb-4"><div class="eyebrow">WELCOME BACK</div><h2 class="fw-800 mt-2">Đăng nhập TripMate</h2></div><?php if($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?><form method="post"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>"><div class="mb-3"><label class="form-label">Email</label><input class="form-control" type="email" name="email" required></div><div class="mb-3"><label class="form-label">Mật khẩu</label><input class="form-control" type="password" name="password" required></div><button class="btn btn-primary w-100 py-2">Đăng nhập</button></form><p class="text-center small mt-3 mb-0">Chưa có tài khoản? <a href="<?= base_url('register.php') ?>">Đăng ký</a></p><div class="small text-secondary mt-4">Demo admin: admin@tripmate.local / Admin@123</div></div></div>
<?php include __DIR__.'/includes/footer.php'; ?>
