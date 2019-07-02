class Post < ApplicationRecord
  validates :title, presence: true
  validates :place, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  attachment :image
end
