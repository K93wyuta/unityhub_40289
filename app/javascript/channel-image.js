const channelMainPreview = () => {
  const channelMainPreviewList = document.getElementById('channel-main-image');
  const channelMainFileField = document.querySelector('input[type="file"][name="channel[channel_main_image]"]');

  if (channelMainFileField !== null) {
    channelMainFileField.addEventListener('change', (e) => {
      const channelMainAlreadyPreview = document.querySelector('.firstimage-preview');
      if (channelMainAlreadyPreview){
        channelMainAlreadyPreview.remove();
      };
    const channelMainFile = e.target.files[0];
    const channelMainBlob = window.URL.createObjectURL(channelMainFile);

    const channelMainPreviewImage = document.createElement('img');
    channelMainPreviewImage.setAttribute('class', 'firstimage-preview');
    channelMainPreviewImage.setAttribute('src', channelMainBlob);

    channelMainPreviewList.appendChild(channelMainPreviewImage);
  });
 }
};

const channelBackgroundPreview = () => {
  const channelBackgroundPreviewList = document.getElementById('channel-backgroundimage-image');
  const channelBackgroundFileField = document.querySelector('input[type="file"][name="channel[channel_background_image]"]');

  if (channelBackgroundFileField !== null) {
  channelBackgroundFileField.addEventListener('change', (e) => {
    const channelBackgroundAlreadyPreview = document.querySelector('.secondimage-preview');
    if (channelBackgroundAlreadyPreview){
      channelBackgroundAlreadyPreview.remove();
    };

    const channelBackgroundFile = e.target.files[0];
    const channelBackgroundBlob = window.URL.createObjectURL(channelBackgroundFile);

    const channelBackgroundPreviewImage = document.createElement('img');
    channelBackgroundPreviewImage.setAttribute('class', 'secondimage-preview');
    channelBackgroundPreviewImage.setAttribute('src', channelBackgroundBlob);

    channelBackgroundPreviewList.appendChild(channelBackgroundPreviewImage);
  });
 }
};

window.addEventListener('turbo:load', channelMainPreview);
window.addEventListener('turbo:render', channelMainPreview);
window.addEventListener('turbo:load', channelBackgroundPreview);
window.addEventListener('turbo:render', channelBackgroundPreview);