# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthday               :date
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  gender                 :string(255)
#  place                  :string(255)
#  provider               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          default("general"), not null
#  uid                    :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_id               :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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
