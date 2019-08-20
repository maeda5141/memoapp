require  'rails_helper'

describe Article do
  describe '#create' do
    it 'title, body, public, user_idがあれば登録できる' do
      user = create(:user)
      article = build(:article, user_id: user.id)
      article.valid?
      expect(article).to be_valid
    end
    it 'user_idがなければ登録できない' do
      article = build(:article, user_id: nil)
      article.valid?
      expect(article.errors[:user]).to include("を入力してください")
    end
    it '存在しないuser_idで登録できない' do
      article = build(:article, user_id: 0)
      article.valid?
      expect(article.errors[:user]).to include("を入力してください")
    end
    it 'titleが空であれば登録できない' do
      user = create(:user)
      article = build(:article, title:"")
      article.valid?
      expect(article.errors[:title]).to include("を入力してください")
    end
    it 'bodyが空であれば登録できない' do
      user = create(:user)
      article = build(:article, body:"")
      article.valid?
      expect(article.errors[:body]).to include("を入力してください")
    end
    it 'publicが空であれば登録できない' do
      user = create(:user)
      article = build(:article, public: nil)
      article.valid?
      expect(article.errors[:public]).to include("を入力してください")
    end
  end
  
end