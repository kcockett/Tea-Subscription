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
      customer_1 = create(:customer)
      customer_2 = FactoryBot.build(:customer)
      invalid_params = { customer: { first_name: customer_2.first_name, last_name: customer_2.last_name, email: customer_1.email, address: customer_2.address } }
      post '/api/v0/customers', params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'with invalid params' do
    it 'returns bad request when missing first_name' do
      customer = FactoryBot.build(:customer)
      valid_params = { customer: { last_name: customer.last_name, email: customer.email, address: customer.address } }
      post '/api/v0/customers', params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns bad request when missing last_name' do
      customer = FactoryBot.build(:customer)
      valid_params = { customer: { first_name: customer.first_name, email: customer.email, address: customer.address } }
      post '/api/v0/customers', params: valid_params
  
      expect(response).to have_http_status(:unprocessable_entity)
    end
    
    it 'returns bad request when missing email' do
      customer = FactoryBot.build(:customer)
      valid_params = { customer: { first_name: customer.first_name, last_name: customer.last_name, address: customer.address } }
      post '/api/v0/customers', params: valid_params
  
      expect(response).to have_http_status(:unprocessable_entity)
    end
    
    it 'returns bad request when missing address' do
      customer = FactoryBot.build(:customer)
      valid_params = { customer: { first_name: customer.first_name, last_name: customer.last_name, email: customer.email } }
      post '/api/v0/customers', params: valid_params
  
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end