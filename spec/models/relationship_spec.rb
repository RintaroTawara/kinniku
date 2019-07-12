require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user_a = FactoryBot.create(:user, email: 'a@example.com')
    @user_b = FactoryBot.create(:user, email: 'b@example.com')
    @relationship =  Relationship.new(follower_id: @user_a.id, followed_id: @user_b.id)
  end

  context '関係が有効である時' do
    it 'フォローが登録される' do
      expect(@relationship).to be_valid
    end
  end

  context '関係が無効である時' do
    it 'follower_idが必要' do
      @relationship.follower_id = ""
      expect(@relationship).not_to be_valid
    end

    it 'followed_idが必要' do
      @relationship.followed_id = ""
      expect(@relationship).not_to be_valid
    end
  end

end