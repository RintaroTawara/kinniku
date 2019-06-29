require "rails_helper"

describe "ユーザー管理機能", type: :system do
  describe '新規作成機能' do
    before do
      visit new_user_registration_path
      fill_in "Username", with: "testuser"
      fill_in "Email", with: "test@examples.com"
      fill_in "Password", with: testpass
      fill_in "Password confirmation", with: "testpass"
      click_button "Sign up"
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "testpass" }
      it 'トップページに遷移する' do
        expect(page).to have_selector '.notice', text: 'アカウント登録を受け付けました。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).to have_css('div#error_explanation')
      end
    end
  end


  describe 'ログイン機能' do
    let!(:user) { FactoryBot.create(:user, email: "test@examples.com") }

    before do
      visit new_user_session_path
      fill_in 'Email', with: "test@examples.com"
      fill_in 'Password', with: testpass
      click_button 'Log in'
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "password" }
      it '記事一覧ページに遷移する' do
        expect(page).to have_selector '.notice', text: 'ログインしました。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).not_to have_selector '.notice'
      end
    end
  end

  describe '編集機能' do
    let!(:user) { FactoryBot.create(:user, email: "test@examples.com") }
    before do
      visit new_user_session_path
      fill_in 'Email', with: "test@examples.com"
      fill_in 'Password', with: "password"
      click_button 'Log in'
      visit edit_user_registration_path
      fill_in 'Username', with: 'TARO'
      fill_in 'Email', with: 'taro@examples.com'
      fill_in 'Password', with: 'password1'
      fill_in 'Password confirmation', with: 'password1'
      fill_in 'Current password', with: testpass
      click_on 'Update'
    end

    context '有効な情報を入力したとき' do
      let(:testpass) { "password" }
      it 'ユーザ情報が更新される' do
        expect(page).to have_selector '.notice', text: 'アカウントが更新されました。'
      end
    end

    context '無効な情報を入力したとき' do
      let(:testpass) { "pass" }
      it 'エラーとなる' do
        expect(page).to have_css('div#error_explanation')
      end
    end
  end
end