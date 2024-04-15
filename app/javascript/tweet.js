const imagePreview = (previewListId, fileFieldSelector, previewImageClass) => {
  const previewList = document.getElementById(previewListId);
  const fileField = document.querySelector(fileFieldSelector);

  if (fileField !== null) {
    fileField.addEventListener('change', (e) => {
      const alreadyPreview = document.querySelector('.'+previewImageClass);
      if (alreadyPreview) {
        alreadyPreview.remove();
      };

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', previewImageClass);
      previewImage.setAttribute('src', blob);

      previewList.appendChild(previewImage);
    });
  }
};

// Define preview functions for tweet and message.
const tweetPreview = () => imagePreview('tweet-image', 'input[type="file"][name="tweet[tweet_image]"]', 'tweet-preview');
const messagePreview = () => imagePreview('message-image', 'input[type="file"][name="message[message_image]"]', 'message-preview');

window.addEventListener('turbo:load', tweetPreview);
window.addEventListener('turbo:load', messagePreview);