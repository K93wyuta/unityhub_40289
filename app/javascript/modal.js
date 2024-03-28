const leftContentModal = () => {
  const leaveModal = document.querySelector('.channel-box-modal'); // モーダルを取得
    const leaveTrigger = document.querySelector('.channel-box'); // トリガーを取得
    const leaveOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    leaveTrigger.addEventListener('click', function() {
        const leaveIsModalHidden = leaveModal.style.display === 'none';
        leaveModal.style.display = leaveIsModalHidden ? 'block' : 'none';
        leaveOverlay.style.display = leaveIsModalHidden ? 'block' : 'none'; 
      });
  
      const leaveBack = leaveModal.querySelector('.channel-box-modal-button-n'); // 閉じるボタンを取得
  
      if (leaveBack !== null) {
        leaveBack.addEventListener('click', function() {
          leaveModal.style.display = 'none';
          leaveOverlay.style.display = 'none';
      });
    };
  };

const indexModal = () => {
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

const editModal = () => {
const deleteModal = document.querySelector('.channel-form-actions-button-delete-modal'); // モーダルを取得
  const deleteTrigger = document.querySelector('.channel-form-actions-button-delete'); // トリガーを取得
  const deleteOverlay = document.querySelector('.overlay'); // オーバーレイを取得

  deleteTrigger.addEventListener('click', function() {
      const deleteIsModalHidden = deleteModal.style.display === 'none';
      deleteModal.style.display = deleteIsModalHidden ? 'block' : 'none';
      deleteOverlay.style.display = deleteIsModalHidden ? 'block' : 'none'; 
    });

    const deleteBack = deleteModal.querySelector('.channel-form-actions-button-delete-modal-button-n'); // 閉じるボタンを取得

    if (deleteBack !== null) {
      deleteBack.addEventListener('click', function() {
        deleteModal.style.display = 'none';
        deleteOverlay.style.display = 'none';
    });
  };
};

window.addEventListener('turbo:load', leftContentModal);
window.addEventListener('turbo:load', indexModal);
window.addEventListener('turbo:load', editModal);