const channelMainPreview = () => {
  const channelMainPreviewList = document.getElementById('custom-channel-form-main-image-previews');
  const channelMainFileField = document.querySelector('input[type="file"][name="channel[channel_main_image]"]');

  if (channelMainFileField !== null) {
    channelMainFileField.addEventListener('change', (e) => {
      const channelMainAlreadyPreview = document.querySelector('.channel-form-main-image-preview');
      if (channelMainAlreadyPreview){
        channelMainAlreadyPreview.remove();
      };
    const channelMainFile = e.target.files[0];
    const channelMainBlob = window.URL.createObjectURL(channelMainFile);

    const channelMainPreviewImage = document.createElement('img');
    channelMainPreviewImage.setAttribute('class', 'channel-form-main-image-preview');
    channelMainPreviewImage.setAttribute('src', channelMainBlob);

    channelMainPreviewList.appendChild(channelMainPreviewImage);
  });
 }
};

const channelBackgroundPreview = () => {
  const channelBackgroundPreviewList = document.getElementById('custom-channel-form-background-image-previews');
  const channelBackgroundFileField = document.querySelector('input[type="file"][name="channel[channel_background_image]"]');

  if (channelBackgroundFileField !== null) {
  channelBackgroundFileField.addEventListener('change', (e) => {
    const channelBackgroundAlreadyPreview = document.querySelector('.channel-form-background-image-preview');
    if (channelBackgroundAlreadyPreview){
      channelBackgroundAlreadyPreview.remove();
    };

    const channelBackgroundFile = e.target.files[0];
    const channelBackgroundBlob = window.URL.createObjectURL(channelBackgroundFile);

    const channelBackgroundPreviewImage = document.createElement('img');
    channelBackgroundPreviewImage.setAttribute('class', 'channel-form-background-image-preview');
    channelBackgroundPreviewImage.setAttribute('src', channelBackgroundBlob);

    channelBackgroundPreviewList.appendChild(channelBackgroundPreviewImage);
  });
 }
};

const channelAdministratorPreview = () => {
  const channelAdministratorPreviewList = document.getElementById('custom-channel-form-background-image-previews');
  const channelBackgroundFileField = document.querySelector('input[type="file"][name="channel[channel_background_image]"]');

  if (channelBackgroundFileField !== null) {
  channelBackgroundFileField.addEventListener('change', (e) => {
    const channelBackgroundAlreadyPreview = document.querySelector('.channel-form-background-image-preview');
    if (channelBackgroundAlreadyPreview){
      channelBackgroundAlreadyPreview.remove();
    };

    const channelBackgroundFile = e.target.files[0];
    const channelBackgroundBlob = window.URL.createObjectURL(channelBackgroundFile);

    const channelBackgroundPreviewImage = document.createElement('img');
    channelBackgroundPreviewImage.setAttribute('class', 'channel-form-background-image-preview');
    channelBackgroundPreviewImage.setAttribute('src', channelBackgroundBlob);

    channelBackgroundPreviewList.appendChild(channelBackgroundPreviewImage);
  });
 }
};

window.addEventListener('turbo:load', channelMainPreview);
window.addEventListener('turbo:load', channelBackgroundPreview);