const profilePreview = () => {
  const profilePreviewList = document.getElementById('profileimage-previews');
  const profileFileField = document.querySelector('input[type="file"][name="user[profile_image]"]');

  if (profileFileField !== null) {
  profileFileField.addEventListener('change', (e) => {
    const profileAlreadyPreview = document.querySelector('.preview-profileimage');
    if (profileAlreadyPreview){
      profileAlreadyPreview.remove();
    };

    const profileFile = e.target.files[0];
    const profileBlob = window.URL.createObjectURL(profileFile);

    const profilePreviewImage = document.createElement('img');
    profilePreviewImage.setAttribute('class', 'preview-profileimage');
    profilePreviewImage.setAttribute('src', profileBlob);

    profilePreviewList.appendChild(profilePreviewImage);
  });
 }
};

const backgroundPreview = () => {
  const backgroundPreviewList = document.getElementById('backgroundimage-previews');
  const backgroundFileField = document.querySelector('input[type="file"][name="user[background_image]"]');

  if (backgroundFileField !== null) {
  backgroundFileField.addEventListener('change', (e) => {
    const backgroundAlreadyPreview = document.querySelector('.preview-backgroundimage');
    if (backgroundAlreadyPreview){
      backgroundAlreadyPreview.remove();
    };

    const backgroundFile = e.target.files[0];
    const backgroundBlob = window.URL.createObjectURL(backgroundFile);

    const backgroundPreviewImage = document.createElement('img');
    backgroundPreviewImage.setAttribute('class', 'preview-backgroundimage');
    backgroundPreviewImage.setAttribute('src', backgroundBlob);

    backgroundPreviewList.appendChild(backgroundPreviewImage);
  });
 }
};

window.addEventListener('turbo:load', profilePreview);
window.addEventListener('turbo:load', backgroundPreview);