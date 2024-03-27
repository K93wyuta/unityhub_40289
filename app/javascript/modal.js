document.addEventListener('DOMContentLoaded', (event) => {
  const modals = document.querySelectorAll('.modal-channel-login');
  const triggers = document.querySelectorAll('.channel-index-box');
  const overlay = document.querySelector('.overlay');

  triggers.forEach(function(trigger, index) {
    trigger.addEventListener('click', function() {
      const isModalHidden = modals[index].style.display === 'none';
      modals[index].style.display = isModalHidden ? 'block' : 'none';
      overlay.style.display = isModalHidden ? 'block' : 'none';
    });

    const back = modals[index].querySelector('.modal-channel-login-back');

    if (back !== null) {
      back.addEventListener('click', function() {
        modals[index].style.display = 'none';
        overlay.style.display = 'none';
      });
    }
  });
});