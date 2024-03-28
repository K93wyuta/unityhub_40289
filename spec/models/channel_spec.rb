require 'rails_helper'

RSpec.describe Channel, type: :model do
  before do
    @channel = FactoryBot.build(:channel)
  end

  describe 'チャンネル新規登録' do
    context '新規登録ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@channel).to be_valid
      end
      it 'name・identification・password・password_confirmationが存在していれば登録できる' do
        @channel.channel_main_image = nil
        @channel.channel_background_image = nil
        @channel.introduction = ''
        @channel.valid?
        expect(@channel).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @channel.name = ''
        @channel.valid?
        expect(@channel.errors.full_messages).to include("Name can't be blank")
      end
      it 'identificationが空では登録できない' do
        @channel.identification = ''
        @channel.valid?
        expect(@channel.errors.full_messages).to include("Identification can't be blank")
      end
      it '重複したidentificationが存在する場合は登録できない' do
        @channel.save
        another_channel = FactoryBot.build(:channel)
        another_channel.identification = @channel.identification
        another_channel.valid?
        expect(another_channel.errors.full_messages).to include('Identification has already been taken')
      end
      it 'passwordが空では登録できない' do
        @channel.password = nil
        @channel.valid?
        expect(@channel.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @channel.password = '123456'
        @channel.password_confirmation = '1234567'
        @channel.valid?
        expect(@channel.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @channel.password = '00000'
        @channel.password_confirmation = '00000'
        @channel.valid?
        expect(@channel.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @channel.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @channel.password_confirmation = @channel.password
        @channel.valid?
        expect(@channel.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
