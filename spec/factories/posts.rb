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

FactoryBot.define do
  factory :post do
    title { '肩トレ' }
    content { '肩トレしましょう！' }
    user
  end
end
