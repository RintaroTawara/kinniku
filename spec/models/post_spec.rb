require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.new(title: "title", place: "Tokyo", content: "description")
  end

  context "投稿が有効であるとき" do
    it "投稿が登録される" do
      expect(@post).to be_valid
    end
  end

  context "投稿が無効であるとき" do
    it "タイトルが存在しない" do
      @post.title = ""
      expect(@post).not_to be_valid
    end

    it "場所が存在しない" do
      @post.place = ""
      expect(@post).not_to be_valid
    end

    it "詳細が存在しない" do
      @post.content = ""
      expect(@post).not_to be_valid
    end
  end
end
