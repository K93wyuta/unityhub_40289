require 'rails_helper'

RSpec.describe Album, type: :model do
  before do
    @album = FactoryBot.build(:album)

    sleep 0.1
  end

  describe 'アルバム新規投稿' do
    context 'アルバム新規投稿ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        album = FactoryBot.build(:album)
        expect(@album).to be_valid
      end
    end
    context 'アルバム新規投稿ができない場合' do
      it 'titleがないと保存できない' do
        @album.title = ''
        @album.valid?
        expect(@album.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
