FactoryGirl.define do
  factory :permission_group do
    sequence(:code) { |n| "PERM_GROUP#{n}" }
    name { "Permission Group for code #{code}" }
  end

end
