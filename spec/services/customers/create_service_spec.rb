RSpec.describe Customers::CreateService do

# allow_any_instance_of(Alliance).to receive(:save).and_return(true)
# expect(Customer).to receive(:new).and_return(Customer.new) <---- mock
# allow(Customer).to receive(:new).and_return(Customer.new) <---- stub

  describe ".execute" do

    let(:customer_save_return) { true }
    let(:customer_name) { 'Testing Customer' }
    let(:params) {{
      name: customer_name,
      domain: 'testcustomer.com'
    }}
    before { expect_any_instance_of(Customer).to receive(:save).and_return(customer_save_return) }

    subject { Customers::CreateService.new.execute(params) }

    context "with valid params" do

      let(:default_user) { User.new }
      before { expect_any_instance_of(Customer).to receive(:default_user).and_return(default_user) }
      before { expect(default_user).to receive(:save).and_return(true) }

      it { should be_valid }

    end

    context "with invalid params" do
      let(:customer_name) { nil }
      let(:customer_save_return) { false }
      it { should_not be_valid }
    end

  end

end
