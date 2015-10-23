class Admin::CustomersController < Admin::ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create

    @customer = Customers::CreateService.new.execute customer_params

    if @customer.valid?
      redirect_to admin_customers_path
    else
      render :new
    end

  end

  private

  def customer_params

    params.require(:customer).permit(:name, :domain)

  end

end
