const modal = () => {
const modals = document.querySelectorAll('.modal-channel-login'); // モーダルを取得
  const triggers = document.querySelectorAll('.channel-index-box'); // トリガーを取得
  const overlay = document.querySelector('.overlay'); // オーバーレイを取得

  triggers.forEach(function(trigger, index) {
    trigger.addEventListener('click', function() {
      const isModalHidden = modals[index].style.display === 'none';
      modals[index].style.display = isModalHidden ? 'block' : 'none';
      overlay.style.display = isModalHidden ? 'block' : 'none'; 
    });

    const back = modals[index].querySelector('.modal-channel-login-back'); // 閉じるボタンを取得

    if (back !== null) {
      back.addEventListener('click', function() {
        modals[index].style.display = 'none';
        overlay.style.display = 'none';
      });
    }
  });
};

window.addEventListener('turbo:load', modal);