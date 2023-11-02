require 'rails_helper'

RSpec.describe 'GET /api/v0/customers/:id/subscriptions', type: :request do
  describe 'with valid customer id' do
    it 'returns a list of subscriptions' do
      customer = create(:customer)
      tea_1 = Tea.all.first
      tea_2 = Tea.all.second
      tea_3 = Tea.all.third
      subsciption_1 = Subscription.create!(title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_1.id, status: "active", frequency_months: 1)
      subsciption_2 = Subscription.create!(title: "Bi-monthly Green Tea", price: 6.95, customer_id: customer.id, tea_id: tea_2.id, status: "active", frequency_months: 2)
      subsciption_2 = Subscription.create!(title: "Monthly Chamomile Tea", price: 8.95, customer_id: customer.id, tea_id: tea_3.id, status: "canceled", frequency_months: 1)
      get "/api/v0/customers/#{customer.id}/subscriptions"

      expect(response).to have_http_status(:ok)
    end
  end
  describe 'with invalid data' do
    it 'returns an error with invalid customer id' do
      customer = create(:customer)
      tea_1 = Tea.all.first
      tea_2 = Tea.all.second
      tea_3 = Tea.all.third
      subsciption_1 = Subscription.create!(title: "Monthly English Breakfast", price: 7.95, customer_id: customer.id, tea_id: tea_1.id, status: "active", frequency_months: 1)
      subsciption_2 = Subscription.create!(title: "Bi-monthly Green Tea", price: 6.95, customer_id: customer.id, tea_id: tea_2.id, status: "active", frequency_months: 2)
      subsciption_2 = Subscription.create!(title: "Monthly Chamomile Tea", price: 8.95, customer_id: customer.id, tea_id: tea_3.id, status: "canceled", frequency_months: 1)
      get "/api/v0/customers/9999999999/subscriptions"

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end