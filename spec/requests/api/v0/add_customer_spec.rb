require 'rails_helper'

RSpec.describe 'POST /api/v0/customers', type: :request do
  describe 'with valid params' do
    it 'creates a new customer' do
      customer = FactoryBot.build(:customer)
      valid_params = { customer: { first_name: customer.first_name, last_name: customer.last_name, email: customer.email, address: customer.address } }
      post '/api/v0/customers', params: valid_params

      expect(response).to have_http_status(:created)
    end
  end
  
  describe 'handles email uniqueness' do
    it 'returns bad request when email is not unique' do
      # Future sad path tests
    end
  end

  describe 'with invalid params' do
    it 'returns bad request when missing first_name' do
      # Future sad path tests
    end
  end
end