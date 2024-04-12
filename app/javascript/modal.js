const indexModal = () => {
  const triggers = document.querySelectorAll('.channel-index-list'); // トリガーを取得
  const modals = document.querySelectorAll('#modal-channel-login'); // モーダルを取得
  const overlay = document.querySelector('.overlay'); // オーバーレイを取得

  if(triggers) {
    triggers.forEach(function(trigger, index) {
      trigger.addEventListener('click', function() {
        const isModalHidden = modals[index].style.display === 'none';
        modals[index].style.display = isModalHidden ? 'block' : 'none';
        overlay.style.display = isModalHidden ? 'block' : 'none'; 
      });

      const back = modals[index].querySelector('.modal-back'); // 閉じるボタンを取得

      if (back !== null) {
        back.addEventListener('click', function() {
          modals[index].style.display = 'none';
          overlay.style.display = 'none';
        });
      }
    });
  };
};

function Modal(triggerSelector, modalSelector, closeSelector) {
  const trigger = document.querySelector(triggerSelector); // トリガーを取得
  const modal = document.querySelector(modalSelector); // モーダルを取得
  const overlay = document.querySelector('.overlay'); // オーバーレイを取得

  if(modal && trigger) {
    trigger.addEventListener('click', function() {
      const modalHidden = modal.style.display === 'none';
      modal.style.display = modalHidden ? 'block' : 'none';
      overlay.style.display = modalHidden ? 'block' : 'none';
    });

    const closeButton = modal.querySelector(closeSelector);

    if (closeButton) {
      closeButton.addEventListener('click', function() {
        modal.style.display = 'none';
        overlay.style.display = 'none';
      });
    }
  }
}

window.addEventListener('turbo:load', function() {
  indexModal(); // チャンネル ログイン
  Modal('.channel-left-channel', '#modal-channel-logout', '.modal-actions-n'); // ナビゲーション チャンネル ログアウト
  Modal('.channel-left-logout', '#modal-user-logout', '.modal-actions-n'); // ナビゲーション ユーザー ログアウト
  Modal('.form-action-delete', '#modal-channel-delete', '.modal-actions-n'); // チャンネル 削除
  Modal('.form-action-delete', '#modal-user-delete', '.modal-actions-n'); // ユーザー 削除
  Modal('.channel-tweet-action', '#modal-tweet-new', '.modal-back'); // ツイート 新規投稿
  Modal('.channel-show-buttom-topics-list-right-center-actions-delete', '#modal-show-topics-delete', '.modal-actions-n'); // News&Topics 削除
  Modal('.form-action-delete', '#modal-album-delete', '.modal-actions-n'); // アルバム 削除
});