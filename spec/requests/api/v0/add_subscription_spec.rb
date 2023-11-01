require 'rails_helper'

RSpec.describe 'POST /api/v0/subscriptions', type: :request do
  describe 'with valid params' do
    it 'creates a new subscription' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post '/api/v0/subscriptions', params: valid_params

      expect(response).to have_http_status(:created)
    end
  end
  
  describe 'handles subscription duplication' do
    it 'returns bad request when email is not unique' do
      # Future sad path tests
    end
  end

  describe 'with invalid params' do
    it 'returns bad request when missing customer_id' do
      # Future sad path tests
    end
  end
end