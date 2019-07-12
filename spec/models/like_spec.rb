require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(title: "title", content: "description")
    @like = FactoryBot.create(:like, user_id: @user.id, post_id: @post.id)
  end

  context 'いいねが有効である時' do
    it 'いいねが登録される' do
      expect(@like).to be_valid
    end
  end

  context 'いいねが無効である時' do
    it 'ログインしていない' do
      @like.user_id = ""
      expect(@like).not_to be_valid
    end

    it '投稿がない時' do
      @like.post_id = ""
      expect(@like).not_to be_valid
    end
  end
end
