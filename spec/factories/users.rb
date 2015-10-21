FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}@payit.com" }
    email { username }
    password "pwd12345"
    encrypted_password "pwd12345"
  end
end
