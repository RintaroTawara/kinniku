FactoryBot.define do
  factory :post do
    title { '肩トレ' }
    content { '肩トレしましょう！' }
    user
  end
end
