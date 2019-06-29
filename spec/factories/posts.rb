FactoryBot.define do
  factory :post do
    title { '肩トレ' }
    place { '東京' }
    content { '肩トレしましょう！' }
    user
  end
end
