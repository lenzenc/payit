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

end
