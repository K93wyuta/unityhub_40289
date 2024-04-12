const imagePreview = (inputName, previewId, imgClass, model = 'user') => {
  const previewList = document.getElementById(previewId);
  const fileField = document.querySelector(`input[type="file"][name="${model}[${inputName}]"]`);

  if (fileField !== null) {
    fileField.addEventListener('change', (e) => {
      const alreadyPreview = document.querySelector(`.${imgClass}`);
      if (alreadyPreview) {
        alreadyPreview.remove();
      };

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', imgClass);
      previewImage.setAttribute('src', blob);

      previewList.appendChild(previewImage);
    });
  }
};

window.addEventListener('turbo:load', () => {
  imagePreview('profile_image', 'user-profile-image', 'firstimage-preview');
  imagePreview('background_image', 'user-backgroundimage-image', 'secondimage-preview');
  imagePreview('channel_main_image', 'channel-main-image', 'firstimage-preview', 'channel');
  imagePreview('channel_background_image', 'channel-backgroundimage-image', 'secondimage-preview', 'channel');
});

window.addEventListener('turbo:render', () => {
  imagePreview('profile_image', 'user-profile-image', 'firstimage-preview');
  imagePreview('background_image', 'user-backgroundimage-image', 'secondimage-preview');
  imagePreview('channel_main_image', 'channel-main-image', 'firstimage-preview', 'channel');
  imagePreview('channel_background_image', 'channel-backgroundimage-image', 'secondimage-preview', 'channel');
});