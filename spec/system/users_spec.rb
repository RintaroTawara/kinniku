require "rails_helper"

describe "ユーザー管理機能", type: :system do
  describe '新規作成機能' do
    before do
      visit new_user_registration_path
      fill_in "ユーザ名", with: "testuser"
      fill_in "メールアドレス", with: "test@examples.com"
      fill_in "パスワード", with: testpass
      fill_in "パスワード(確認)", with: "testpass"
      click_button "登録"
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
      fill_in 'メールアドレス', with: "test@examples.com"
      fill_in 'パスワード', with: testpass
      click_button 'ログイン'
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
      fill_in 'メールアドレス', with: "test@examples.com"
      fill_in 'パスワード', with: "password"
      click_button 'ログイン'
      visit edit_user_registration_path
      fill_in 'ユーザ名', with: 'TARO'
      fill_in 'メールアドレス', with: 'taro@examples.com'
      fill_in 'パスワード', with: 'password1'
      fill_in 'パスワード(確認)', with: 'password1'
      click_on '更新'
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