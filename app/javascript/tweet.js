const tweetPreview = () => {
  const tweetPreviewList = document.getElementById('tweet-previews');
  const tweetFileField = document.querySelector('input[type="file"][name="tweet[tweet_image]"]');

  if (tweetFileField !== null) {
  tweetFileField.addEventListener('change', (e) => {
    const tweetAlreadyPreview = document.querySelector('.preview-tweet-image');
    if (tweetAlreadyPreview){
      tweetAlreadyPreview.remove();
    };

    const tweetFile = e.target.files[0];
    const tweetBlob = window.URL.createObjectURL(tweetFile);

    const tweetPreviewImage = document.createElement('img');
    tweetPreviewImage.setAttribute('class', 'preview-tweet-image');
    tweetPreviewImage.setAttribute('src', tweetBlob);

    tweetPreviewList.appendChild(tweetPreviewImage);
  });
 }
};

window.addEventListener('turbo:load', tweetPreview);