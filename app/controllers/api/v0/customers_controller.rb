class Api::V0::CustomersController < ApplicationController
  def create
    require 'pry'; binding.pry
    customer = Customer.new(customer_params)

    if customer.save
      render json: customer, status: :created
    else
      # Future sad path features
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end
end