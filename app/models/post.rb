class Post < ApplicationRecord
  acts_as_taggable
  
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
