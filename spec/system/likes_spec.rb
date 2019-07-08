require 'rails_helper'

describe 'Like機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post) }
  let(:like) { FactoryBot.create(:like, user_id: user.id, post_id: post.id) }

  before do
    visit user_session_path
    fill_in 'メールアドレス', with: 'test1@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    visit post_path(post)
  end

  describe "Like前" do
    it "Likeが増える" do
      find('.it-Actions_like').click
      expect(page).to have_content '1'
    end
  end

  describe "Like後" do
    it "Likeが減る" do
      find('.it-Actions_like').click
      find('.it-Actions_like').click
      expect(page).to have_content '0'
    end
  end
  

end