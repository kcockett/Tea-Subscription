require 'rails_helper'

RSpec.describe 'GET /api/v0/teas', type: :request do
  describe 'no parameters required' do
    it 'should return a list of all teas and their information' do
      get '/api/v0/teas'
      all_teas = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(all_teas.count).to eq(10)
    end
  end
end