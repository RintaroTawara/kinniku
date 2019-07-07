require 'rails_helper'

describe '記事検索機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, email: 'b@example.com') }
  let!(:post_a) { FactoryBot.create(:post, user: user_a, title: '最初のトレーニング') }

  before do
    visit user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  shared_examples_for 'ユーザーAが作成した記事が表示される' do
    it { expect(page).to have_content '最初のトレーニング' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した記事が表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }
      
      it_behaves_like 'ユーザーAが作成した記事が表示される'
    end
  end


  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した記事が表示される'
    end
  end


  describe '新規作成機能' do
    let(:login_user) { user_a }

    before do
      visit new_post_path
      fill_in 'タイトル', with: post_title
      fill_in '詳細', with: post_content
      click_button '投稿'
    end

    context '新規登録作成画面で全てを入力した時' do
      let(:post_title) { '新規作成のトレーニングを書く' }
      let(:post_content) { '新規作成のトレーニングです。' }

      it '正常に登録される' do
        expect(page).to have_selector '.notice', text: '新規作成のトレーニングを書く'
      end
    end

    context '新規登録でトレーニング内容を記述しなかった時' do
      let(:post_title) { '' }
      let(:post_content) { '新規作成のトレーニングです。' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end

    context '新規登録で投稿内容を記述しなかった時' do
      let(:post_title) { '新規作成のトレーニングを書く' }
      let(:post_content) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '詳細を入力してください'
        end
      end
    end
  end


  describe '投稿編集機能' do
    let(:login_user) { user_a }

    before do
      visit post_path(post_a)
      click_link '編集'
      fill_in 'タイトル', with: post_title
      fill_in '詳細', with: post_content
      click_button '投稿'
    end

    context '編集画面で全てを入力した時' do
      let(:post_title) { '新規作成のトレーニングを書く' }
      let(:post_content) { '新規作成のトレーニングです。' }

      it '正常に登録される' do
        expect(page).to have_selector '.notice', text: '新規作成のトレーニングを書く'
      end
    end

    context '編集画面でタイトルを記述しなかった時' do
      let(:post_title) { '' }
      let(:post_content) { '新規作成のトレーニングです。' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end


    context '編集画面で詳細を記述しなかった時' do
      let(:post_title) { '新規作成のトレーニングを書く' }
      let(:post_content) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '詳細を入力してください'
        end
      end
    end
  end


  describe '投稿削除機能' do
    let(:login_user) { user_a }

    before do
      visit post_path(post_a)
      click_link '削除'
      page.accept_confirm '記事「最初のトレーニング」を削除します。よろしいですか'
    end

    it '投稿が削除される' do
      expect(page).not_to have_content '最初のトレーニング'
    end
  end
end