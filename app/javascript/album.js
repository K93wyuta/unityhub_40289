const albumPreview = () => {
  // プレビューを表示するためのスペースを取得
  const albumPreviewList = document.getElementById('form-field-preview');
    
  // 投稿できる枚数の制限を定義
  const albumImageLimits = 100;

  // プレビュー画像を生成・表示する関数
  const albumBuildPreviewImage = (albumDataIndex, albumBlob) =>{
    // 画像を表示するためのdiv要素を生成
    const albumPreviewWrapper = document.createElement('div');
    albumPreviewWrapper.setAttribute('class', 'form-field-preview');
    albumPreviewWrapper.setAttribute('data-index', albumDataIndex);

    // 表示する画像を生成
    const albumPreviewImage = document.createElement('img');
    albumPreviewImage.setAttribute('class', 'form-field-preview-image');
    albumPreviewImage.setAttribute('src', albumBlob);

    // 削除ボタンを生成
    const albumDeleteButton = document.createElement("div");
    albumDeleteButton.setAttribute("class", "image-delete-button");
    albumDeleteButton.innerText = "削除";

    // 削除ボタンをクリックしたらプレビューとfile_fieldを削除させる
    albumDeleteButton.addEventListener("click", () => albumDeleteImage(albumDataIndex));

    // 生成したHTMLの要素をブラウザに表示させる
    albumPreviewWrapper.appendChild(albumPreviewImage);
    albumPreviewList.appendChild(albumPreviewWrapper);
  };

  // file_fieldを生成・表示する関数
  const albumBuildNewFileField = () =>{
    // 2枚目用のfile_fieldを作成
    const albumNewFileField = document.createElement('input');
    albumNewFileField.setAttribute('type', 'file');
    albumNewFileField.setAttribute('name', 'album[album_images][]');

    // 最後のfile_fieldを取得
    const albumLastFileField = document.querySelector('input[type="file"][name="album[album_images][]"]:last-child');

    // nextDataIndex = 最後のfile_fieldのdata-index + 1
    const albumNextDataIndex = Number(albumLastFileField.getAttribute('data-index')) +1;
    albumNewFileField.setAttribute('data-index', albumNextDataIndex);

    // 生成したfile_fieldを表示
    const albumFileFieldArea = document.querySelector('.form-field-image-input2');
    albumFileFieldArea.appendChild(albumNewFileField);

    // 指定したdata-indexを持つプレビューとfile_fieldを削除する
    const albumDeleteImage = (albumDataIndex) => {
    const albumDeletePreviewImage = document.querySelector('.form-field-preview[data-index="${albumDataIndex}"]');
    albumDeletePreviewImage.remove();
    const albumDeleteFileField = document.querySelector('input[type="file"][data-index="${albumDataIndex}"]');
    albumDeleteFileField.remove();

    // 画像の枚数が最大のときに削除ボタンを押した場合、file_fieldを1つ追加する
    const albumImageCount = document.querySelectorAll(".form-field-preview").length;
    if (albumImageCount == albumImageLimits - 1) albumBuildNewFileField();
    };
  };

  // input要素で値の変化が起きた際に呼び出される関数の中身
  const changedFileField = (e) => {
    // data-index（何番目を操作しているか）を取得
    const albumDataIndex = e.target.getAttribute('data-index');

    const albumFile = e.target.files[0];

    // fileが空 = 何も選択しなかったのでプレビュー等を削除して終了する
    if (!albumFile) {
      albumDeleteImage(albumDataIndex);
      return null;
    };

    const albumBlob = window.URL.createObjectURL(albumFile);

    // data-indexを使用して、既にプレビューが表示されているかを確認する
    const albumAlreadyPreview = document.querySelector('.form-field-preview[data-index="${albumDataIndex}"]');

    if (albumAlreadyPreview) {
      // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
      const albumAlreadyPreviewImage = albumAlreadyPreview.querySelector("img");
      albumAlreadyPreviewImage.setAttribute("src", albumBlob);
      return null;
    };

    albumBuildPreviewImage(albumDataIndex, albumBlob);

    // 画像の枚数制限に引っかからなければ、新しいfile_fieldを追加する
    const albumImageCount = document.querySelectorAll(".form-field-preview").length;
    if (albumImageCount < albumImageLimits) albumBuildNewFileField();
  };

  // input要素を取得
  const albumFileField = document.querySelector('input[type="file"][name="album[album_images][]"]');

  // input要素で値の変化が起きた際に呼び出される関数
  albumFileField.addEventListener('change', changedFileField);
};

window.addEventListener('turbo:load', albumPreview);