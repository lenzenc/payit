FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Joe#{n}" }
    sequence(:last_name) { |n| "Blow#{n}" }
    employee_id { "#{first_name}.#{last_name}" }
    customer
    sequence(:username) { |n| "username#{n}@#{customer.domain}" unless customer.nil? }
    email { username }
    password "pwd12345"
    encrypted_password "pwd12345"
  end
end
