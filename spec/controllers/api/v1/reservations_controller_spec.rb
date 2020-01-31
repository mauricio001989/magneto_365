require 'rails_helper'

describe Api::V1::ReservationsController do
  describe 'GET #index' do
    subject(:http_request) { get :index }

    before do
      http_request
    end

    it 'responds with ok status code' do
      expect(response).to have_http_status(:ok)
    end
  end
end
