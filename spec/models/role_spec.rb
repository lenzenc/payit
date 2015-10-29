require 'rails_helper'

RSpec.describe Role, :type => :model do

  describe "Associations" do

    it { should have_and_belong_to_many(:permissions) }
    it { should have_and_belong_to_many(:feature_modules) }
    it { should have_and_belong_to_many(:users) }

  end

  describe "Validations" do

    subject { build :role }

    it { should validate_presence_of :name }
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_uniqueness_of :name }

  end

end
