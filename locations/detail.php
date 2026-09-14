<?php
session_start();
require __DIR__.'/../config/database.php';
require __DIR__.'/../includes/helpers.php';

$id=(int)($_GET['id']??0);
$st=$pdo->prepare('SELECT l.*,c.name category_name,COALESCE(ROUND(AVG(r.rating),1),l.rating) AS display_rating,COUNT(r.id) AS review_count FROM locations l JOIN categories c ON c.id=l.category_id LEFT JOIN reviews r ON r.location_id=l.id WHERE l.id=? GROUP BY l.id,c.name');
$st->execute([$id]);
$loc=$st->fetch();
if(!$loc){http_response_code(404);exit('Location not found');}

$uid=!empty($_SESSION['user'])?(int)$_SESSION['user']['id']:0;
$st=$pdo->prepare('SELECT id FROM favorites WHERE user_id=? AND location_id=?');
$st->execute([$uid,$id]);
$isFav=$uid>0 && (bool)$st->fetch();

function cp06_upload_review_images(array $files, int $reviewId, PDO $pdo): array {
    $saved=[]; $errors=[];
    if(empty($files) || !isset($files['name']) || !is_array($files['name'])) return [$saved,$errors];
    $uploadDir=__DIR__.'/../uploads/reviews';
    if(!is_dir($uploadDir)) @mkdir($uploadDir,0775,true);
    $finfo=new finfo(FILEINFO_MIME_TYPE);
    $allowed=['image/jpeg'=>'jpg','image/png'=>'png','image/webp'=>'webp'];
    $count=0;
    foreach($files['name'] as $i=>$original){
        if(($files['error'][$i]??UPLOAD_ERR_NO_FILE)===UPLOAD_ERR_NO_FILE) continue;
        if(($files['error'][$i]??UPLOAD_ERR_OK)!==UPLOAD_ERR_OK){$errors[]='Có một ảnh không thể tải lên.';continue;}
        if($count>=5){$errors[]='Mỗi đánh giá tối đa 5 ảnh.';break;}
        if((int)($files['size'][$i]??0)>5*1024*1024){$errors[]='Mỗi ảnh tối đa 5MB.';continue;}
        $tmp=$files['tmp_name'][$i]??'';
        $mime=$finfo->file($tmp);
        if(!isset($allowed[$mime])){$errors[]='Chỉ chấp nhận ảnh JPG, PNG hoặc WEBP.';continue;}
        $name=bin2hex(random_bytes(12)).'.'.$allowed[$mime];
        $dest=$uploadDir.'/'.$name;
        if(!move_uploaded_file($tmp,$dest)){$errors[]='Không thể lưu một ảnh.';continue;}
        $relative='uploads/reviews/'.$name;
        $pdo->prepare('INSERT INTO review_images(review_id,image_path) VALUES(?,?)')->execute([$reviewId,$relative]);
        $saved[]=$relative; $count++;
    }
    return [$saved,$errors];
}

if($_SERVER['REQUEST_METHOD']==='POST' && isset($_POST['review_action'])){
    if(empty($_SESSION['user'])){
        flash('warning','Bạn cần đăng nhập để đánh giá địa điểm.');
        redirect('login.php');
    }
    verify_csrf();
    $action=$_POST['review_action'];
    $userId=$uid;

    if($action==='add'){
        $rating=max(1,min(5,(int)($_POST['rating']??5)));
        $comment=trim($_POST['comment']??'');
        if($comment===''){flash('warning','Vui lòng nhập nội dung đánh giá.');redirect('locations/detail.php?id='.$id.'#reviews');}
        $exists=$pdo->prepare('SELECT id FROM reviews WHERE user_id=? AND location_id=?');
        $exists->execute([$userId,$id]);
        if($exists->fetchColumn()){flash('warning','Bạn đã đánh giá địa điểm này. Bạn có thể sửa đánh giá hiện tại.');redirect('locations/detail.php?id='.$id.'#reviews');}
        try{
            $pdo->beginTransaction();
            $ins=$pdo->prepare('INSERT INTO reviews(user_id,location_id,rating,comment) VALUES(?,?,?,?)');
            $ins->execute([$userId,$id,$rating,$comment]);
            $reviewId=(int)$pdo->lastInsertId();
            [$saved,$uploadErrors]=cp06_upload_review_images($_FILES['review_images']??[], $reviewId, $pdo);
            $pdo->commit();
            flash('success',empty($uploadErrors)?'Đã đăng đánh giá và ảnh.':'Đã đăng đánh giá, nhưng một số ảnh không tải lên được.');
        }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();flash('danger','Không thể đăng đánh giá lúc này.');}
        redirect('locations/detail.php?id='.$id.'#reviews');
    }

    if($action==='edit'){
        $reviewId=(int)($_POST['review_id']??0);
        $st=$pdo->prepare('SELECT id FROM reviews WHERE id=? AND user_id=? AND location_id=?');
        $st->execute([$reviewId,$userId,$id]);
        if(!$st->fetchColumn()){http_response_code(403);exit('403 - Bạn không có quyền sửa đánh giá này.');}
        $rating=max(1,min(5,(int)($_POST['rating']??5)));
        $comment=trim($_POST['comment']??'');
        if($comment===''){flash('warning','Vui lòng nhập nội dung đánh giá.');redirect('locations/detail.php?id='.$id.'#reviews');}
        try{
            $pdo->beginTransaction();
            $pdo->prepare('UPDATE reviews SET rating=?,comment=? WHERE id=? AND user_id=?')->execute([$rating,$comment,$reviewId,$userId]);
            $current=(int)$pdo->query('SELECT COUNT(*) FROM review_images WHERE review_id='.(int)$reviewId)->fetchColumn();
            if($current<5 && !empty($_FILES['review_images'])){
                $remaining=max(0,5-$current);
                $tmpFiles=$_FILES['review_images'];
                if(isset($tmpFiles['name']) && is_array($tmpFiles['name'])){
                    $tmpFiles['name']=array_slice($tmpFiles['name'],0,$remaining);$tmpFiles['type']=array_slice($tmpFiles['type'],0,$remaining);$tmpFiles['tmp_name']=array_slice($tmpFiles['tmp_name'],0,$remaining);$tmpFiles['error']=array_slice($tmpFiles['error'],0,$remaining);$tmpFiles['size']=array_slice($tmpFiles['size'],0,$remaining);
                }
                cp06_upload_review_images($tmpFiles,$reviewId,$pdo);
            }
$pdo->commit();
            flash('success','Đã cập nhật đánh giá.');
        }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();flash('danger','Không thể cập nhật đánh giá.');}
        redirect('locations/detail.php?id='.$id.'#reviews');
    }

    if($action==='delete'){
        $reviewId=(int)($_POST['review_id']??0);
        $st=$pdo->prepare('SELECT id FROM reviews WHERE id=? AND user_id=? AND location_id=?');
        $st->execute([$reviewId,$userId,$id]);
        if(!$st->fetchColumn()){http_response_code(403);exit('403 - Bạn không có quyền xóa đánh giá này.');}
        $imgs=$pdo->prepare('SELECT image_path FROM review_images WHERE review_id=?');$imgs->execute([$reviewId]);
        foreach($imgs->fetchAll(PDO::FETCH_COLUMN) as $path){$full=__DIR__.'/../'.ltrim($path,'/');if(is_file($full))@unlink($full);}
        $pdo->prepare('DELETE FROM reviews WHERE id=? AND user_id=?')->execute([$reviewId,$userId]);
        flash('info','Đã xóa đánh giá.');redirect('locations/detail.php?id='.$id.'#reviews');
    }
}

$st=$pdo->prepare('SELECT r.*,u.full_name FROM reviews r JOIN users u ON u.id=r.user_id WHERE r.location_id=? ORDER BY r.created_at DESC,r.id DESC LIMIT 30');
$st->execute([$id]);$reviews=$st->fetchAll();
$reviewIds=array_column($reviews,'id');$reviewImages=[];
if($reviewIds){$ph=implode(',',array_fill(0,count($reviewIds),'?'));$st=$pdo->prepare("SELECT * FROM review_images WHERE review_id IN ($ph) ORDER BY id ASC");$st->execute($reviewIds);foreach($st->fetchAll() as $img)$reviewImages[$img['review_id']][]=$img;}
$myReview=null;
if($uid){$st=$pdo->prepare('SELECT * FROM reviews WHERE user_id=? AND location_id=?');$st->execute([$uid,$id]);$myReview=$st->fetch()?:null;}
$pageTitle=$loc['name'];include __DIR__.'/../includes/header.php';show_flash();
?>
<div class="container py-5">
  <div class="row g-5">
    <div class="col-lg-6"><img class="detail-img" src="<?= e($loc['image_url']) ?>" alt="<?= e($loc['name']) ?>"></div>
    <div class="col-lg-6"><span class="badge-soft"><?= e($loc['category_name']) ?></span><h1 class="fw-800 mt-3"><?= e($loc['name']) ?></h1><p class="text-secondary">📍 <?= e($loc['address']) ?></p><div class="display-6 fw-bold">⭐ <?= e($loc['display_rating']) ?></div><p class="mt-4 text-secondary"><?= nl2br(e($loc['description'])) ?></p><div class="d-flex gap-2 flex-wrap mt-4"><a class="btn btn-primary" href="<?= base_url('user/trips.php?add_location='.$loc['id']) ?>">+ Thêm vào chuyến đi</a><button type="button" class="btn btn-outline-dark js-favorite <?= $isFav?'is-favorite':'' ?>" data-location-id="<?= $id ?>" aria-pressed="<?= $isFav?'true':'false' ?>"><?= $isFav?'♥ Đã lưu':'♡ Lưu địa điểm' ?></button></div><div class="info-strip mt-4"><span>Chi phí dự kiến</span><strong><?= number_format($loc['average_cost'],0,',','.') ?>đ</strong></div></div>
  </div>

  <section id="reviews" class="mt-5">
    <div class="d-flex justify-content-between align-items-end"><div><div class="eyebrow">COMMUNITY</div><h3 class="fw-800 mb-0">Đánh giá địa điểm</h3></div><span class="text-secondary small"><?= (int)$loc['review_count'] ?> đánh giá</span></div>
    <?php if(!$uid): ?>
      <div class="login-required-panel mt-3"><div><strong>🔒 Bạn muốn chia sẻ trải nghiệm?</strong><div class="small text-secondary mt-1">Hãy đăng nhập để đánh giá và tải ảnh chuyến đi lên.</div></div><button type="button" class="btn btn-primary rounded-3" data-login-link="1">Đăng nhập để đánh giá</button></div>
    <?php elseif($myReview): ?>
      <div class="panel mt-3 mb-3"><div class="d-flex justify-content-between align-items-center mb-3"><div><strong>Đánh giá của bạn</strong><div class="small text-secondary">Bạn đã đánh giá địa điểm này. Có thể cập nhật thêm ảnh.</div></div><span class="pill">Đã đăng</span></div><form method="post" enctype="multipart/form-data"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>"><input type="hidden" name="review_action" value="edit"><input type="hidden" name="review_id" value="<?= (int)$myReview['id'] ?>"><div class="row g-3"><div class="col-md-3"><label class="form-label small fw-semibold">Số sao</label><select class="form-select" name="rating"><?php for($s=5;$s>=1;$s--): ?><option value="<?= $s ?>" <?= (int)$myReview['rating']===$s?'selected':'' ?>><?= str_repeat('⭐',$s) ?></option><?php endfor; ?></select></div><div class="col-md-9"><label class="form-label small fw-semibold">Nhận xét</label><textarea class="form-control" name="comment" rows="3" required><?= e($myReview['comment']) ?></textarea></div><div class="col-12"><label class="form-label small fw-semibold">Thêm ảnh <span class="text-secondary fw-normal">(tối đa 5 ảnh/review, JPG/PNG/WEBP, mỗi ảnh 5MB)</span></label><input class="form-control" type="file" name="review_images[]" accept="image/jpeg,image/png,image/webp" multiple></div><div class="col-12 d-flex gap-2"><button class="btn btn-primary">Cập nhật đánh giá</button><button class="btn btn-outline-danger" name="review_action" value="delete" onclick="return confirm('Xóa đánh giá này?')">Xóa đánh giá</button></div></div></form></div>
    <?php else: ?>
      <div class="panel mt-3 mb-3"><form method="post" enctype="multipart/form-data"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>"><input type="hidden" name="review_action" value="add"><div class="row g-3"><div class="col-md-3"><label class="form-label small fw-semibold">Số sao</label><select class="form-select" name="rating"><option value="5">⭐⭐⭐⭐⭐</option><option value="4">⭐⭐⭐⭐</option><option value="3">⭐⭐⭐</option><option value="2">⭐⭐</option><option value="1">⭐</option></select></div><div class="col-md-9"><label class="form-label small fw-semibold">Nhận xét</label><textarea class="form-control" name="comment" rows="3" placeholder="Bạn thấy địa điểm này thế nào?" required></textarea></div><div class="col-12"><label class="form-label small fw-semibold">Ảnh trải nghiệm <span class="text-secondary fw-normal">(tối đa 5 ảnh, mỗi ảnh 5MB)</span></label><input class="form-control" type="file" name="review_images[]" accept="image/jpeg,image/png,image/webp" multiple></div><div class="col-12 text-end"><button class="btn btn-primary px-4">Đăng đánh giá</button></div></div></form></div>
    <?php endif; ?>

    <?php foreach($reviews as $r): ?><article class="review-item review-card"><div class="d-flex justify-content-between gap-3"><div class="d-flex gap-2 align-items-start"><div class="member-avatar">👤</div><div><strong><?= e($r['full_name']) ?></strong><div class="small text-secondary mt-1">⭐ <?= e($r['rating']) ?> <span class="mx-1">·</span> <?= date('d/m/Y H:i',strtotime($r['created_at'])) ?></div></div></div><?php if($uid && $uid===(int)$r['user_id']): ?><span class="pill">Đánh giá của bạn</span><?php endif; ?></div><div class="review-comment mt-3"><?= nl2br(e($r['comment'])) ?></div><?php if(!empty($reviewImages[$r['id']])): ?><div class="review-gallery mt-3"><?php foreach($reviewImages[$r['id']] as $img): ?><a href="<?= base_url($img['image_path']) ?>" target="_blank" rel="noopener"><img src="<?= e(base_url($img['image_path'])) ?>" alt="Ảnh trải nghiệm"></a><?php endforeach; ?></div><?php endif; ?></article><?php endforeach; ?>
    <?php if(!$reviews): ?><div class="empty-state mt-3">Chưa có đánh giá. Hãy là người đầu tiên chia sẻ trải nghiệm.</div><?php endif; ?>
  </section>
</div>
<?php include __DIR__.'/../includes/footer.php'; ?>
