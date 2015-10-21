RSpec.describe User, :type => :model do

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
