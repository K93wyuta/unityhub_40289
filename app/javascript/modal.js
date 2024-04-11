const leftContentModal = () => {
  const leaveModal = document.querySelector('.modal'); // モーダルを取得
    const leaveTrigger = document.querySelector('.channel-left-channel'); // トリガーを取得
    const leaveOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    if(leaveTrigger) {
      leaveTrigger.addEventListener('click', function() {
          const leaveIsModalHidden = leaveModal.style.display === 'none';
          leaveModal.style.display = leaveIsModalHidden ? 'block' : 'none';
          leaveOverlay.style.display = leaveIsModalHidden ? 'block' : 'none'; 
        });
    
        const leaveBack = leaveModal.querySelector('.modal-actions-n'); // 閉じるボタンを取得
    
        if (leaveBack !== null) {
          leaveBack.addEventListener('click', function() {
            leaveModal.style.display = 'none';
            leaveOverlay.style.display = 'none';
        });
      };
    };
  };

const indexModal = () => {
const modals = document.querySelectorAll('.modal'); // モーダルを取得
  const triggers = document.querySelectorAll('.channel-index-list'); // トリガーを取得
  const overlay = document.querySelector('.overlay'); // オーバーレイを取得

  if(triggers) {
    triggers.forEach(function(trigger, index) {
      trigger.addEventListener('click', function() {
        const isModalHidden = modals[index].style.display === 'none';
        modals[index].style.display = isModalHidden ? 'block' : 'none';
        overlay.style.display = isModalHidden ? 'block' : 'none'; 
      });

      const back = modals[index].querySelector('.channel-index-modal-back'); // 閉じるボタンを取得

      if (back !== null) {
        back.addEventListener('click', function() {
          modals[index].style.display = 'none';
          overlay.style.display = 'none';
        });
      }
    });
  };
};

const editModal = () => {
const deleteModal = document.querySelector('#modal-channel-delete'); // モーダルを取得
  const deleteTrigger = document.querySelector('.form-action-delete'); // トリガーを取得
  const deleteOverlay = document.querySelector('.overlay'); // オーバーレイを取得

  if(deleteTrigger) {
    deleteTrigger.addEventListener('click', function() {
        const deleteIsModalHidden = deleteModal.style.display === 'none';
        deleteModal.style.display = deleteIsModalHidden ? 'block' : 'none';
        deleteOverlay.style.display = deleteIsModalHidden ? 'block' : 'none'; 
      });

      const deleteBack = deleteModal.querySelector('.modal-actions-n'); // 閉じるボタンを取得

      if (deleteBack !== null) {
        deleteBack.addEventListener('click', function() {
          deleteModal.style.display = 'none';
          deleteOverlay.style.display = 'none';
      });
    };
  };
};

const userEditModal = () => {
  const userDeleteModal = document.querySelector('#modal-user-delete'); // モーダルを取得
    const userDeleteTrigger = document.querySelector('.form-action-delete'); // トリガーを取得
    const userDeleteOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    if(userDeleteTrigger) {
      userDeleteTrigger.addEventListener('click', function() {
          const userDeleteIsModalHidden = userDeleteModal.style.display === 'none';
          userDeleteModal.style.display = userDeleteIsModalHidden ? 'block' : 'none';
          userDeleteOverlay.style.display = userDeleteIsModalHidden ? 'block' : 'none'; 
        });
    
        const userDeleteBack = userDeleteModal.querySelector('.modal-actions-n'); // 閉じるボタンを取得
    
        if (userDeleteBack !== null) {
          userDeleteBack.addEventListener('click', function() {
            userDeleteModal.style.display = 'none';
            userDeleteOverlay.style.display = 'none';
        });
      };
    };
  };

// tweet start
const tweetModal = () => {
  const tweetNewModal = document.querySelector('#modal-tweet-new'); // モーダルを取得
    const tweetNewTrigger = document.querySelector('.channel-tweet-action'); // トリガーを取得
    const tweetNewOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    if(tweetNewTrigger) {
      tweetNewTrigger.addEventListener('click', function() {
          const tweetNewIsModalHidden = tweetNewModal.style.display === 'none';
          tweetNewModal.style.display = tweetNewIsModalHidden ? 'block' : 'none';
          tweetNewOverlay.style.display = tweetNewIsModalHidden ? 'block' : 'none'; 
        });
    
        const tweetNewBack = tweetNewModal.querySelector('.modal-back'); // 閉じるボタンを取得
    
        if (tweetNewBack !== null) {
          tweetNewBack.addEventListener('click', function() {
            tweetNewModal.style.display = 'none';
            tweetNewOverlay.style.display = 'none';
        });
      };
    };
  };
// tweet end

// topic delete modal start
const topicModal = () => {
  const topicDeleteModal = document.querySelector('#modal-show-topics-delete'); // モーダルを取得
    const topicDeleteTrigger = document.querySelector('.channel-show-buttom-topics-list-right-center-actions-delete'); // トリガーを取得
    const topicDeleteOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    if(topicDeleteTrigger) {
      topicDeleteTrigger.addEventListener('click', function() {
          const topicDeleteIsModalHidden = topicDeleteModal.style.display === 'none';
          topicDeleteModal.style.display = topicDeleteIsModalHidden ? 'block' : 'none';
          topicDeleteOverlay.style.display = topicDeleteIsModalHidden ? 'block' : 'none'; 
        });
    
        const topicDeleteBack = topicDeleteModal.querySelector('.modal-actions-n'); // 閉じるボタンを取得
    
        if (topicDeleteBack !== null) {
          topicDeleteBack.addEventListener('click', function() {
            topicDeleteModal.style.display = 'none';
            topicDeleteOverlay.style.display = 'none';
        });
      };
    };
  };
// topic delete modal start

// album delete modal start
const albumModal = () => {
  const albumDeleteModal = document.querySelector('#modal-album-delete'); // モーダルを取得
    const albumDeleteTrigger = document.querySelector('.form-action-delete'); // トリガーを取得
    const albumDeleteOverlay = document.querySelector('.overlay'); // オーバーレイを取得
  
    if(albumDeleteTrigger) {
      albumDeleteTrigger.addEventListener('click', function() {
          const albumDeleteIsModalHidden = albumDeleteModal.style.display === 'none';
          albumDeleteModal.style.display = albumDeleteIsModalHidden ? 'block' : 'none';
          albumDeleteOverlay.style.display = albumDeleteIsModalHidden ? 'block' : 'none'; 
        });
    
        const albumDeleteBack = albumDeleteModal.querySelector('.modal-actions-n'); // 閉じるボタンを取得
    
        if (albumDeleteBack !== null) {
          albumDeleteBack.addEventListener('click', function() {
            albumDeleteModal.style.display = 'none';
            albumDeleteOverlay.style.display = 'none';
        });
      };
    };
  };
// topic delete modal start

window.addEventListener('turbo:load', leftContentModal);
window.addEventListener('turbo:load', indexModal);
window.addEventListener('turbo:load', editModal);
window.addEventListener('turbo:load', userEditModal);
window.addEventListener('turbo:load', tweetModal);
window.addEventListener('turbo:load', topicModal);
window.addEventListener('turbo:load', albumModal);