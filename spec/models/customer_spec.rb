require 'rails_helper'

RSpec.describe Customer, :type => :model do

  describe "Validations" do

    subject { build(:customer) }

    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:domain) }
    it { should ensure_length_of(:domain).is_at_most(100) }
    it { should validate_uniqueness_of(:domain) }
    it { should allow_value("payit.com").for(:domain) }
    it { should_not allow_value(
      "@payit.com",
      "payit",
      ".com"
      ).for(:domain) }

  end

end
