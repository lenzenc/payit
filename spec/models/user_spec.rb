RSpec.describe User, :type => :model do

  describe "Associations" do

    it { should belong_to :customer }

  end

  describe "Validations" do

    subject { build :user }

    it { should validate_presence_of :first_name }
    it { should ensure_length_of(:first_name).is_at_most(100) }

    it { should validate_presence_of :last_name }
    it { should ensure_length_of(:last_name).is_at_most(100) }

    it { should validate_presence_of :employee_id }
    it { should ensure_length_of(:employee_id ).is_at_most(100) }
    it { should validate_uniqueness_of(:employee_id).scoped_to(:customer_id) }

    it { should validate_presence_of :customer }

  end

  describe "#find_for_database_authentication" do

    let(:user) { create :user }
    let(:conditions) { {username: user.username} }
    subject { User.find_for_database_authentication conditions }

    context "when conditions hash contains username" do
      context "and user exists" do
        it { should_not be_nil }
        it { should eq user }
      end
      context "and user does not exist" do
        let(:conditions) { {username: "doesnotexist@payit.com"} }
        it { should be_nil }
      end
    end

    context "when conditions hash does not contain username" do
      let(:conditions) { {} }
      it { should be_nil }
    end

  end

end
