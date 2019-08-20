require 'rails_helper'
describe User do
  describe '#create' do
    it 'name, email, password, password_confirmationがあれば登録できる' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it 'nameが空であれば登録できない' do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end
    it 'emailが空であれば登録できない' do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    it 'passwordが空であれば登録できない' do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
    it 'password_confirmationが空であれば登録できない' do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end
    it 'emailが重複していれば登録できない' do
      past_user = create(:user)
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include("は既に使用されています。")
    end
    it 'passwordが6文字以上なら登録できる' do
      user = build(:user, password:"000000", password_confirmation:"000000")
      user.valid?
      expect(user).to be_valid
    end
    it 'passwordが5文字以下なら登録できない' do
      user = build(:user, password:"00000", password_confirmation:"00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end
    
  end
end
