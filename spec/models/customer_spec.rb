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

  describe ".default_user" do

    let(:customer) { build :customer }
    subject { customer.default_user }

    it { should_not be_nil }
    its(:first_name) { should eq("PayIt") }
    its(:last_name) { should eq("Admin") }
    its(:employee_id) { should eq("payit.admin") }
    its(:email) { should eq("payitadmin@#{customer.domain}") }
    its(:username) { should eq("payitadmin@#{customer.domain}") }
    its(:password) { should eq("payit123") }
    its(:password_confirmation) { should eq("payit123") }
    its(:customer) { should eq(customer) }

    it { should be_valid }

  end

end
