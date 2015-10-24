FactoryGirl.define do
  factory :customer do
    sequence(:name) { |n| "Customer#{n}" }
    domain { "#{name.downcase}.com" }
    is_active true
  end

end
