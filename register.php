<?php
session_start(); require __DIR__.'/config/database.php'; require __DIR__.'/includes/helpers.php';
if (!empty($_SESSION['user'])) redirect('user/dashboard.php');
$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
  verify_csrf(); $name=trim($_POST['name']??''); $email=trim($_POST['email']??''); $password=$_POST['password']??''; $confirm=$_POST['confirm']??'';
  if(strlen($name)<2) $error='Họ tên quá ngắn.'; elseif(!filter_var($email,FILTER_VALIDATE_EMAIL)) $error='Email không hợp lệ.'; elseif(strlen($password)<8) $error='Mật khẩu tối thiểu 8 ký tự.'; elseif($password!==$confirm) $error='Mật khẩu xác nhận không khớp.';
  if(!$error){$st=$pdo->prepare('SELECT id FROM users WHERE email=?');$st->execute([$email]);if($st->fetch())$error='Email đã tồn tại.';}
  if(!$error){$st=$pdo->prepare('INSERT INTO users(full_name,email,password_hash,role,status) VALUES(?,?,? ,\'user\',\'active\')');$st->execute([$name,$email,password_hash($password,PASSWORD_DEFAULT)]);flash('success','Đăng ký thành công. Mời bạn đăng nhập.');redirect('login.php');}
}
$pageTitle='Đăng ký'; include __DIR__.'/includes/header.php';
?>
<div class="auth-wrap"><div class="auth-card"><div class="text-center mb-4"><div class="eyebrow">START YOUR JOURNEY</div><h2 class="fw-800 mt-2">Tạo tài khoản</h2></div><?php if($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?><form method="post"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>"><div class="mb-3"><label class="form-label">Họ tên</label><input class="form-control" name="name" required></div><div class="mb-3"><label class="form-label">Email</label><input class="form-control" type="email" name="email" required></div><div class="mb-3"><label class="form-label">Mật khẩu</label><input class="form-control" type="password" name="password" minlength="8" required></div><div class="mb-3"><label class="form-label">Nhập lại mật khẩu</label><input class="form-control" type="password" name="confirm" minlength="8" required></div><button class="btn btn-primary w-100 py-2">Tạo tài khoản</button></form></div></div>
<?php include __DIR__.'/includes/footer.php'; ?>
