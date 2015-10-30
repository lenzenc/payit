FactoryGirl.define do
  factory :role do
    ignore do
      permission_codes []
    end
    sequence(:name) { |n| "Role#{n}" }

    after(:build) do |role, evaluator|
      evaluator.permission_codes.each { |code|
        role.permissions << build(:permission, code: code.to_s)
      }
    end

  end

end
