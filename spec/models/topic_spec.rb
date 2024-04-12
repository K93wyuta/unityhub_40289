require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    user = FactoryBot.create(:user)
    channel = FactoryBot.create(:channel)
    channel_user = FactoryBot.create(:channel_user, user: user, channel: channel)
    @topic = FactoryBot.create(:topic, channel_user_id: channel_user.id, channel_id: channel.id)

    sleep 0.1
  end

  describe 'News&Topics新規投稿' do
    context 'News&Topics新規投稿ができる場合' do
      it 'すべての項目が存在していれば、新規投稿できる' do
        expect(@topic).to be_valid
      end
    end
    context 'News&Topics新規投稿ができない場合' do
      it 'titleが存在しないと作成できない' do
        @topic.title = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが存在しないと作成できない' do
        @topic.text = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
