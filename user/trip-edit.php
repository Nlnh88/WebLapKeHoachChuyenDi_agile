<?php
session_start();
require __DIR__.'/../config/database.php';
require __DIR__.'/../includes/helpers.php';
require_login();
$uid = $_SESSION['user']['id'];
$id = (int)($_GET['id'] ?? 0);
$destinations = $pdo->query("SELECT DISTINCT destination FROM locations WHERE destination IS NOT NULL AND destination<>'' ORDER BY destination")->fetchAll(PDO::FETCH_COLUMN);
$st = $pdo->prepare('SELECT * FROM trips WHERE id=? AND owner_id=?');
$st->execute([$id,$uid]);
$trip = $st->fetch();
if (!$trip) { http_response_code(404); exit('Trip not found'); }
$error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
  verify_csrf();
  $name=trim($_POST['name']??''); $destination=trim($_POST['destination']??'');
  $start=$_POST['start_date']??''; $end=$_POST['end_date']??''; $budget=(float)($_POST['budget']??0); $desc=trim($_POST['description']??'');
  if(!$name||!$destination||!$start||!$end||$budget<0) $error='Vui lòng nhập đầy đủ thông tin.';
  elseif(!in_array($destination,$destinations,true)) $error='Vui lòng chọn điểm đến có trong danh sách.';
  elseif($end<$start) $error='Ngày kết thúc phải sau ngày bắt đầu.';
  if(!$error){
    $q=$pdo->prepare('UPDATE trips SET name=?,destination=?,start_date=?,end_date=?,budget=?,description=? WHERE id=? AND owner_id=?');
    $q->execute([$name,$destination,$start,$end,$budget,$desc,$id,$uid]);
    flash('success','Đã cập nhật chuyến đi.'); redirect('user/trip-detail.php?id='.$id);
  }
}
$pageTitle='Chỉnh sửa chuyến đi'; include __DIR__.'/../includes/header.php'; show_flash();
?>
<div class="page-shell"><div class="form-shell">
<div class="eyebrow">EDIT TRIP</div><h1 class="page-title mt-1">Chỉnh sửa chuyến đi</h1><p class="subtext mt-2">Cập nhật thông tin cơ bản của kế hoạch.</p>
<?php if($error): ?><div class="alert alert-danger mt-3"><?= e($error) ?></div><?php endif; ?>
<form method="post" class="row g-3 mt-2">
<input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>">
<div class="col-md-8"><label class="form-label fw-semibold">Tên chuyến đi</label><input class="form-control" name="name" value="<?= e($trip['name']) ?>" required></div>
<div class="col-md-4"><label class="form-label fw-semibold">Điểm đến</label><select class="form-select" name="destination" required><?php foreach($destinations as $d): ?><option value="<?= e($d) ?>" <?= $trip['destination']===$d?'selected':'' ?>><?= e($d) ?></option><?php endforeach; ?></select><small class="text-secondary d-block mt-2">Đổi điểm đến sẽ thay đổi danh sách địa điểm gợi ý cho lịch trình.</small></div>
<div class="col-md-4"><label class="form-label fw-semibold">Ngày bắt đầu</label><input class="form-control" type="date" name="start_date" value="<?= e($trip['start_date']) ?>" required></div>
<div class="col-md-4"><label class="form-label fw-semibold">Ngày kết thúc</label><input class="form-control" type="date" name="end_date" value="<?= e($trip['end_date']) ?>" required></div>
<div class="col-md-4"><label class="form-label fw-semibold">Ngân sách (VNĐ)</label><input class="form-control" type="number" min="0" name="budget" value="<?= e($trip['budget']) ?>" required></div>
<div class="col-12"><label class="form-label fw-semibold">Mô tả</label><textarea class="form-control" rows="4" name="description"><?= e($trip['description']) ?></textarea></div>
<div class="col-12 d-flex gap-2"><button class="btn btn-primary px-4 rounded-3">Lưu thay đổi</button><a class="btn btn-light border rounded-3" href="<?= base_url('user/trip-detail.php?id='.$id) ?>">Hủy</a></div>
</form></div></div>
<?php include __DIR__.'/../includes/footer.php'; ?>
