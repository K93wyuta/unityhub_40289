require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    user = FactoryBot.create(:user)
    channel = FactoryBot.create(:channel)
    channel_user = FactoryBot.create(:channel_user, user:user, channel:channel)
    chat = FactoryBot.build(:chat, channel: channel)
    channel_chat_user = FactoryBot.create(:channel_chat_user, channel_user: channel_user, chat: chat)
    @message = FactoryBot.build(:message, channel_chat_user_id: channel_chat_user.id, chat_id: chat.id)

    sleep 0.1
  end

  describe 'メッセージ新規投稿' do
    context '新規投稿ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@message).to be_valid
      end
      it '画像がなくても投稿できる' do
        @message.message_image = nil
        expect(@message).to be_valid
      end
      it 'textがなくても投稿できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it '画像・textが両方ない場合は保存できない' do
        @message.message_image = nil
        @message.content = ''
        @message.valid?
        expect(@message.errors.full_messages).to include('Either text or image must be present.')
      end
    end
  end
end
