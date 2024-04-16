require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    user = FactoryBot.create(:user)
    channel = FactoryBot.create(:channel)
    channel_user = FactoryBot.create(:channel_user, user:, channel:)
    @chat = FactoryBot.build(:chat, channel: channel)

    sleep 0.1
  end

  describe 'チャット新規登録' do
    context '新規登録ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@chat).to be_valid
      end
      it '画像がなくても投稿できる' do
        @chat.chat_image = nil
        expect(@chat).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @chat.name = ''
        @chat.valid?
        expect(@chat.errors.full_messages).to include("Name can't be blank")
      end
      it 'channel_idが紐づいていないと保存できない' do
        @chat.channel = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('Channel must exist')
      end
    end
  end
end
