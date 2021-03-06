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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  attachment :image

  enum role: { general: 1, admin: 99 }

  class << self
    def find_for_facebook_oauth(auth, _signed_in_resource = nil)
      user = User.where(provider: auth.provider, uid: auth.uid).first
      user ||= User.create(username: auth.extra.raw_info.name,
                           provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           password: Devise.friendly_token[0, 20])
      user
    end

    def find_for_twitter_oauth(auth, _signed_in_resource = nil)
      user = User.where(provider: auth.provider, uid: auth.uid).first
      user ||= User.create(username: auth.info.nickname,
                           provider: auth.provider,
                           uid: auth.uid,
                           email: User.create_unique_email,
                           password: Devise.friendly_token[0, 20])
      user
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
