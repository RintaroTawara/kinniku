# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :text(65535)      not null
#  likes_count :integer
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_id    :string(255)
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  acts_as_taggable
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  class << self
    def search(search)
      if search
        Post.where(['title LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end

    def create_all_ranks
      Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    end

    def execute
      Post.create!(title: "自動", content: "自動", user_id: 1)
    end
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

end
