require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    user = FactoryBot.create(:user)
    channel = FactoryBot.create(:channel)
    channel_user = FactoryBot.create(:channel_user, user:, channel:)
    @tweet = FactoryBot.build(:tweet, channel_user_id: channel_user.id, channel_id: channel.id)

    sleep 0.1
  end

  describe 'ツイート新規投稿' do
    context '新規投稿ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@tweet).to be_valid
      end
      it '画像がなくても投稿できる' do
        @tweet.tweet_image = nil
        expect(@tweet).to be_valid
      end
      it 'textがなくても投稿できる' do
        @tweet.text = ''
        expect(@tweet).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it '画像・textが両方ない場合は保存できない' do
        @tweet.tweet_image = nil
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Either text or image must be present.')
      end
      it 'channel_user_idが紐づいていないと保存できない' do
        @tweet.channel_user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Channel user must exist')
      end
      it 'channel_idが紐づいていないと保存できない' do
        @tweet.channel = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Channel must exist')
      end
    end
  end
end
