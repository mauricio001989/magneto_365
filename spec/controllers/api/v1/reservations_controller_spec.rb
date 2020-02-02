require 'rails_helper'

describe Api::V1::ReservationsController do
  describe 'GET #index' do
    subject(:http_request) { get :index }

    let(:reservation) { create_list(:reservation, 5) }

    before do
      reservation
      http_request
    end

    it 'responds with ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'count reservations' do
      expect(JSON(response.body).count).to eq(Reservation.count)
    end
  end

  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:film) { create(:film) }
    let(:params) do
      {
        user: {
          name: 'mao',
          email: 'mao@hot.com',
          id_document: '55555',
          phone: '3333'
        },
        id_film: film.id
      }
    end

    context 'when we create a reservation correctly' do
      before do
        http_request
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end

      it 'film name valid' do
        expect(JSON(response.body)['film']['name']).to eq(Film.last.name)
      end

      it 'user name are create' do
        expect(JSON(response.body)['user']['name']).to eq(User.last.name)
      end
    end

    context 'when we create a reservation not valid' do
      before 'delete id of user' do
        params[:user].delete(:id_document)
        http_request
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
