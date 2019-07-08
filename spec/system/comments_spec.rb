require 'rails_helper'

describe 'コメント機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post) }
  let(:comment) { FactoryBot.create(:comment, user_id: user.id, post_id: post.id) }

  before do
    visit user_session_path
    fill_in 'メールアドレス', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    visit post_path(post)
  end

  describe "コメントする時" do
    before do
      fill_in 'comment_content', with: content
      click_on 'コメントする'
    end

    context "コメントを入力した時" do
      let(:content) { 'いい記事です' }
      it "コメントが表示される" do
        expect(page).to have_content "いい記事です"
        expect(page).to have_content "コメントを削除する"
      end
    end

    context "コメントを入力しない時" do
      let(:content) { '' }
      it "コメントが表示されない" do
        expect(page).not_to have_content "コメントを削除する"
      end
    end
  end

  describe "コメントを削除する時" do
  end
end