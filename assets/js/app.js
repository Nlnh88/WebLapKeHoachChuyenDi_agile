document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('[data-autosubmit]').forEach(el => el.addEventListener('change', () => el.form?.submit()));
  document.querySelectorAll('[data-confirm]').forEach(el => el.addEventListener('click', e => { const msg=el.getAttribute('data-confirm')||'Bạn có chắc không?'; if(!window.confirm(msg)) e.preventDefault(); }));
  document.querySelectorAll('.counter-input').forEach(input => input.addEventListener('input', () => { const max=input.getAttribute('max'); if(max&&Number(input.value)>Number(max)) input.value=max; }));

  const modalEl=document.getElementById('loginRequiredModal');
  const loginModal=modalEl && window.bootstrap ? new bootstrap.Modal(modalEl) : null;
  document.querySelectorAll('[data-login-link]').forEach(el => el.addEventListener('click', e => { e.preventDefault(); if(loginModal) loginModal.show(); else window.location.href=el.getAttribute('href')||((window.TRIPMATE_BASE||'')+'/login.php'); }));

  const csrf=document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')||'';
  const favoriteUrl=window.TRIPMATE_FAVORITE_URL || ((window.TRIPMATE_BASE||'')+'/actions/favorite.php');

  // CP06: dùng event delegation để nút tim vẫn hoạt động dù card được render/re-render.
  document.addEventListener('click', async (e) => {
    const btn=e.target.closest('.js-favorite');
    if(!btn) return;
    e.preventDefault();
    e.stopPropagation();
    if(btn.disabled) return;

    const locationId=btn.getAttribute('data-location-id');
    if(!locationId) return;

    btn.disabled=true;
    try {
      const res=await fetch(favoriteUrl, {
        method:'POST',
        credentials:'same-origin',
        headers:{
          'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8',
          'X-Requested-With':'XMLHttpRequest',
          'Accept':'application/json'
        },
        body:new URLSearchParams({csrf:csrf, location_id:locationId}).toString()
      });

      const text=await res.text();
      let data={};
      try { data=JSON.parse(text); } catch (_) { throw new Error('Máy chủ không trả về dữ liệu hợp lệ. Kiểm tra actions/favorite.php.'); }

      if(res.status===401 && data.need_login){
        if(loginModal) loginModal.show();
        else window.location.href=(window.TRIPMATE_BASE||'')+'/login.php';
        return;
      }
      if(!res.ok || !data.ok) throw new Error(data.message||'Không thể cập nhật yêu thích.');

      const saved=!!data.saved;
      btn.classList.toggle('is-favorite',saved);
      btn.setAttribute('aria-pressed',saved?'true':'false');
      btn.setAttribute('aria-label',saved?'Bỏ yêu thích':'Thêm yêu thích');
      btn.title=saved?'Bỏ lưu':'Lưu địa điểm';
      if(btn.classList.contains('btn')) btn.textContent=saved?'♥ Đã lưu':'♡ Lưu địa điểm';
      else btn.textContent=saved?'♥':'♡';

      if(!saved && btn.getAttribute('data-remove-on-unsave')==='1') btn.closest('.location-card')?.remove();
      if(window.showToast) window.showToast(data.message);
    } catch(err) {
      console.error('Favorite error:',err);
      alert(err.message||'Không thể cập nhật yêu thích.');
    } finally {
      btn.disabled=false;
    }
  });
});
