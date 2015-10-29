require 'rails_helper'

RSpec.describe FeatureModule, :type => :model do

  describe "Associations" do

    it { should have_and_belong_to_many(:roles) }
    it { should have_and_belong_to_many(:permission_groups) }
    it { should have_and_belong_to_many(:customers) }

  end

  describe "Validations" do

    subject { build :feature_module }

    it { should validate_presence_of :code }
    it { should ensure_length_of(:code).is_at_most(20) }
    it { should validate_uniqueness_of(:code) }

  end

end
