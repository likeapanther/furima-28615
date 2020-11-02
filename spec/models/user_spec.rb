require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do  
    it "新規作成できるか" do
      expect(@user).to be_valid
    end
    context '新規登録がうまくいかない時' do
      it "ニックネームが必須であること" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須であること" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")

      end
      it "メールアドレスが一意性であること" do
        @user.save
        subuser = FactoryBot.build(:user)
        subuser.email = @user.email
        subuser.valid?
        expect(subuser.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは@を含む必要があること" do
          @user.email = "aaaa.aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
          
      end
      it "パスワードが必須であること" do 
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")

      end
      it "パスワードは6文字以上であること" do
        @user.password = "aaa1"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合であること" do
        @user.password = "aaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      
      end
      it "パスワードは確認用を含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end

    end
    context 'エラーハンドリング' do
      it "新規登録時エラーメッセージの出力" do
        @user.nickname = ""
        @user.valid?

      end

      it "ログイン時エラーメッセージの出力" do
        
      end
    end
    context '本人情報確認' do
      it "ユーザー本名が、名字と名前がそれぞれ必須であること" do 
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do end
      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do end
      it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do end
      it "生年月日が必須であること" do end
    end
  end
end
