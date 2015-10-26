FactoryGirl.define do
  factory :permission do
    sequence(:code) { |n| "PERM#{n}" }
    name { "Permission for code #{code}" }
    permission_group
  end

end
