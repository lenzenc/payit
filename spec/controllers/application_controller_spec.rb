RSpec.describe ApplicationController, :type => :controller do

  describe ".access_denied!" do

    controller do
      def index
        access_denied!
      end
    end

    before { get :index }

    it { expect(response).to render_template("errors/access_denied") }
    it { expect(response).to render_template(layout: "layouts/errors") }
    it { expect(response.code).to eq("404") }

  end

  describe ".can?" do

    let(:permission) { "VIEW_CUSTOMER" }
    let(:user) { build(
      :user,
      roles: [build(
        :role,
        permission_codes: ["VIEW_CUSTOMER"])])
    }

    before {
      allow(controller).to receive(:current_user).and_return(user)
    }


    subject { controller.can?(permission) }

    context "when signed_in" do

      let(:permission) { "VIEW_CUSTOMER" }

      context "current_user has given permission" do
        it { should be true }
      end

      context "current_user does not have given permission" do
        let(:permission) { "ADD_EDIT_CUSTOMER" }
        it { should be false }
      end

      context "given permission is lower case" do
        let(:permission) { "add_edit_customer" }
        it { should be false }
      end

    end

    context "when current_user is nil" do
      let(:user) { nil }
      it { should be false }
    end

    context "when permission is nil" do
      let(:permission) { nil }
      it { should be false }
    end

  end

end
