require 'rails_helper'
RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname、email、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          expect(@user).to be_valid
        end
        it 'passwordが半角英数字混合であれば登録できる' do
          @user.password = 'test0903'
          @user.password_confirmation = 'test0903'
          expect(@user).to be_valid
        end
        it 'family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.family_name = '横山'
          expect(@user).to be_valid
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.first_name = '友希'
          expect(@user).to be_valid
        end
        it 'family_name_kanaが全角（カタカナ）であれば登録できる' do
          @user.family_name_kana = 'ヨコヤマ'
          expect(@user).to be_valid
        end
        it 'first_name_kanaが全角（カタカナ）であれば登録できる' do
          @user.first_name_kana = 'ユウキ'
          expect(@user).to be_valid
        end
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = '0903'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
