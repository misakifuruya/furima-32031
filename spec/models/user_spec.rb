require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかない時' do
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

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空だと登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'emailに@が含まれていない場合に登録ができないこと' do
      @user.email = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複するemailが存在する場合に登録ができないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが英字のみの場合に登録ができないこと' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが数字のみの場合に登録ができないこと' do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが全角では登録ができないこと' do
      @user.password = "ｍ111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationは値が同じでないと登録出来ないこと' do
      @user.password = "m000000"
      @user.password_confirmation = "m111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it 'last_nameが全角漢字・ひらがな・カタカナ以外の場合に登録ができないこと' do
      @user.last_name = "1a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが全角漢字・ひらがな・カタカナ以外の場合に登録ができないこと' do
      @user.first_name = "1a"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaが全角カタカナ以外の場合に登録ができないこと' do
      @user.last_name_kana = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが全角カタカナ以外の場合に登録ができないこと' do
      @user.first_name_kana = "ｲ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

  end

end
end
