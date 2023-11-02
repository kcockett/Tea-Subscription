require 'rails_helper'

RSpec.describe 'POST /api/v0/subscriptions', type: :request do
  describe 'with valid params' do
    it 'creates a new subscription' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:created)
    end
  end
  
  describe 'handles subscription duplication' do
    it 'returns bad request when email is not unique' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      subscription = Subscription.create!(title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, status: "active", frequency_months: 1)

      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'with invalid params' do
    it 'returns bad request when missing title' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { price: 7.95, tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns bad request when missing price' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns bad request when missing customer_id' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, tea_id: tea_selection.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns bad request when missing tea_id' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, status: "active", frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns bad request when missing status' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, frequency_months: 1 } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns bad request when missing frequency' do
      customer = create(:customer)
      tea_selection = Tea.all.first
      valid_params = { subscription: { title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_selection.id, status: "active" } }
      post "/api/v0/customers/#{customer.id}/subscriptions", params: valid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end