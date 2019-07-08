FactoryBot.define do
  factory :comment do
    user_id { nil }
    post_id { nil }
    content { "コメント" }
  end
end