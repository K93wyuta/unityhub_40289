require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'name・email・password・password_confirmationが存在していれば登録できる' do
        @user.profile_image = nil
        @user.gender_id = nil
        @user.age_id = nil
        @user.birthday = ''
        @user.mbti_id = nil
        @user.line = ''
        @user.paypay = ''
        @user.background_image = nil
        @user.profile = ''
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'lineが半角英数字でないと登録できない' do
        @user.line = 'テスト'
        @user.valid?
        expect(@user.errors.full_messages).to include('Line is invalid')
      end
      it 'paypayが半角英数字でないと登録できない' do
        @user.paypay = 'テスト'
        @user.valid?
        expect(@user.errors.full_messages).to include('Paypay is invalid')
      end
    end
  end
end
