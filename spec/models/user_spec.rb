require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザが有効であるとき' do
    it 'ユーザが登録される' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザが無効であるとき' do
    it 'メールアドレスが存在しない' do
      @user.email = ""
      expect(@user).not_to be_valid
    end

    it 'メールアドレスが既に登録されている' do
      user = FactoryBot.build(:user, email: "test1@example.com")
      expect(user).not_to be_valid
    end

    it 'パスワードが存在しない' do
      @user.password = ""
      expect(@user).not_to be_valid
    end

    it 'パスワードが短すぎる' do
      @user.password = "a"*5
      expect(@user).not_to be_valid
    end
  end
end
