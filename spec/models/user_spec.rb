require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常な動作の確認' do
      it 'nicknameとemailとpasswordとpassword_confirmationとfamily_name_kanjiと
        first_name_kanjiとfamily_name_katakanaとfirst_name_katakanaとbirthdayが
        存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録/ユーザー情報のバリデーション' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ニックネームが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, nickname: @user.nickname)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Nickname has already been taken')
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '111aa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password_confirmation = @user.password + '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '新規登録/本人情報確認' do
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名字が欠けている場合）' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名前が欠けている場合）' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名字の場合）' do
        @user.family_name_kanji = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名前の場合）' do
        @user.first_name_kanji = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること（名字が欠けている場合）' do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること（名前が欠けている場合）' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名前の場合）' do
        @user.family_name_katakana = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名前の場合）' do
        @user.first_name_katakana = Faker::Internet.username
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
