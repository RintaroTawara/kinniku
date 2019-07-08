require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(title: "title", content: "description")
    @comment = FactoryBot.create(:comment, user_id: @user.id, post_id: @post.id)
  end

  context "コメントが有効であるとき" do
    it "コメントが登録される" do
      expect(@comment).to be_valid
    end
  end

  context "コメントが無効であるとき" do
    it "コメントが存在しない" do
      @comment.content = ""
      expect(@comment).not_to be_valid
    end
  end

end