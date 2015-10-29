FactoryGirl.define do
  factory :feature_module do
    sequence(:code) { |n| "FeatureMod#{n}" }
  end

end
