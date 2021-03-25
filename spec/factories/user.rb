FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test_user@test.co.jp" }
    password { "12345678" }
  end
end