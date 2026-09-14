<?php
session_start();
require __DIR__.'/../config/database.php';
require __DIR__.'/../includes/helpers.php';

$q=trim($_GET['q']??'');
$category=(int)($_GET['category']??0);
$sort=$_GET['sort']??'rating';
$page=max(1,(int)($_GET['page']??1));
$per=8;
$params=[];$where=[];
if($q!==''){ $where[]='(l.name LIKE ? OR l.address LIKE ? OR l.description LIKE ?)'; $like="%$q%";$params=[$like,$like,$like]; }
if($category){$where[]='l.category_id=?';$params[]=$category;}
$sortMap=['rating'=>'display_rating DESC','name'=>'l.name ASC','cost_asc'=>'l.average_cost ASC','cost_desc'=>'l.average_cost DESC'];
$order=$sortMap[$sort]??$sortMap['rating'];
$base='FROM locations l JOIN categories c ON c.id=l.category_id LEFT JOIN reviews rv ON rv.location_id=l.id';
if($where)$base.=' WHERE '.implode(' AND ',$where);
$st=$pdo->prepare("SELECT COUNT(DISTINCT l.id) $base");$st->execute($params);$total=(int)$st->fetchColumn();
$pages=max(1,(int)ceil($total/$per));$offset=($page-1)*$per;
$st=$pdo->prepare("SELECT l.*,c.name category_name,COALESCE(ROUND(AVG(rv.rating),1),l.rating) AS display_rating $base GROUP BY l.id,c.name ORDER BY $order LIMIT $per OFFSET $offset");$st->execute($params);$locations=$st->fetchAll();
$categories=$pdo->query('SELECT * FROM categories ORDER BY name')->fetchAll();
$favoriteIds=[];
if(!empty($_SESSION['user'])){
  $st=$pdo->prepare('SELECT location_id FROM favorites WHERE user_id=?');
  $st->execute([(int)$_SESSION['user']['id']]);
  $favoriteIds=array_map('intval',$st->fetchAll(PDO::FETCH_COLUMN));
}
$pageTitle='Khám phá địa điểm';include __DIR__.'/../includes/header.php';show_flash();
?>
<div class="page-shell">
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-4"><div><div class="eyebrow">EXPLORE</div><h1 class="page-title">Tìm nơi đáng đi</h1><div class="subtext">Tìm theo tên, danh mục, rating hoặc chi phí dự kiến.</div></div><span class="pill"><?= $total ?> địa điểm</span></div>
  <div class="panel mb-4"><form class="row g-2"><div class="col-lg-5"><input class="form-control" name="q" value="<?= e($q) ?>" placeholder="🔍 Tìm Đà Lạt, biển, núi..." autofocus></div><div class="col-lg-3"><select class="form-select" name="category"><option value="0">Tất cả danh mục</option><?php foreach($categories as $c): ?><option value="<?= $c['id'] ?>" <?= $category==$c['id']?'selected':'' ?>><?= e($c['name']) ?></option><?php endforeach; ?></select></div><div class="col-lg-2"><select class="form-select" name="sort"><option value="rating" <?= $sort==='rating'?'selected':'' ?>>Rating cao</option><option value="name" <?= $sort==='name'?'selected':'' ?>>Tên A → Z</option><option value="cost_asc" <?= $sort==='cost_asc'?'selected':'' ?>>Giá thấp</option><option value="cost_desc" <?= $sort==='cost_desc'?'selected':'' ?>>Giá cao</option></select></div><div class="col-lg-2"><button class="btn btn-primary w-100">Tìm kiếm</button></div></form></div>
  <div class="location-grid">
  <?php foreach($locations as $l): $isFav=in_array((int)$l['id'],$favoriteIds,true); ?>
    <article class="location-card">
      <div class="thumb-wrap">
        <img src="<?= e($l['image_url']) ?>" alt="<?= e($l['name']) ?>">
        <button type="button" class="heart-btn js-favorite <?= $isFav?'is-favorite':'' ?>" data-location-id="<?= (int)$l['id'] ?>" data-login-required="1" aria-label="<?= $isFav?'Bỏ yêu thích':'Thêm yêu thích' ?>" aria-pressed="<?= $isFav?'true':'false' ?>"><?= $isFav?'♥':'♡' ?></button>
      </div>
      <div class="location-body"><span class="pill"><?= e($l['category_name']) ?></span><h3><?= e($l['name']) ?></h3><div class="meta-line">📍 <?= e($l['address']) ?></div><div class="price-row"><span class="rating">★ <?= e($l['display_rating']) ?></span><span class="price"><?= number_format($l['average_cost'],0,',','.') ?>đ</span></div><a class="btn btn-sm btn-dark w-100 mt-3 rounded-3" href="<?= base_url('locations/detail.php?id='.$l['id']) ?>">Xem chi tiết</a></div>
    </article>
  <?php endforeach; ?>
  </div>
  <?php if(!$locations): ?><div class="empty-state mt-4">Không tìm thấy địa điểm phù hợp.</div><?php endif; ?>
  <?php if($pages>1): ?><nav class="mt-4"><ul class="pagination justify-content-center"><?php for($i=1;$i<=$pages;$i++): ?><li class="page-item <?= $i===$page?'active':'' ?>"><a class="page-link" href="?<?= http_build_query(['q'=>$q,'category'=>$category,'sort'=>$sort,'page'=>$i]) ?>"><?= $i ?></a></li><?php endfor; ?></ul></nav><?php endif; ?>
</div>
<?php include __DIR__.'/../includes/footer.php'; ?>
