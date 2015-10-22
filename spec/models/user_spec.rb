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

    it { should validate_presence_of :email }
    it { should ensure_length_of(:email).is_at_most(100) }
    it { should allow_value("user@payit.com").for(:email) }
    it { should_not allow_value(
      "@payit.com",
      "payit.com",
      ".com",
      "user",
      "user@"
      ).for(:email) }

    it { should validate_presence_of :customer }

    context "should validate username ends with customer domain" do

      let(:user) { build :user }
      # before { user.valid? }
      subject { user }

      context "when username and customer values exist" do
        context "with username that matches valid format" do
          it { expects(subject.errors_on(:username)).to be_empty }
        end
        context "with username that does not match valid format" do
          let(:user) { build :user, username: "notmatch@blah.com" }
          it { expects(subject.errors_on(:username)).to include(I18n.t('activerecord.errors.models.user.attributes.username.customer_domain')) }
        end
      end
      context "when username is nil" do
        let(:user) { build :user, username: nil }
        it { expects(subject.errors_on(:username)).to be_empty }
      end
      context "when customer is nil" do
        let(:user) { build :user, customer: nil }
        it { expects(subject.errors_on(:username)).to be_empty }
      end
      context "when customer and username is nil" do
        let(:user) { build :user, username: nil, customer: nil }
        it { expects(subject.errors_on(:username)).to be_empty }
      end
    end

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
