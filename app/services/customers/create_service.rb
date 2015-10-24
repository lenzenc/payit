module Customers
  class CreateService

    def execute(params)

      customer = Customer.new params

      Customer.transaction do

        if customer.save
          customer.default_user.save
        end

      end

      customer

    end

  end
end
