FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'test1@example.com' }
    password { 'password' }
  end
end
