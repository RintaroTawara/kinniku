# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_likes_on_post_id              (post_id)
#  index_likes_on_user_id              (user_id)
#  index_likes_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#

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
