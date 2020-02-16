require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { user.posts.create(title: "title", content: "description") }

  context "投稿が有効であるとき" do
    it "投稿が登録される" do
      expect(post).to be_valid
    end
  end

  context "投稿が無効であるとき" do
    it "タイトルが存在しない" do
      post.title = ""
      expect(post).not_to be_valid
    end

    it "詳細が存在しない" do
      post.content = ""
      expect(post).not_to be_valid
    end
  end

  context "検索機能で存在するタイトルを入力したとき" do
    it "検索文字列に一致する投稿を返すこと" do
      expect(Post.search("title")[0]).to eq post
    end
  end

  context "検索機能で存在しないタイトルを入力したとき" do
    it "何も返さないこと" do
      expect(Post.search("タイトル")[0]).to be_nil
    end
  end
end
