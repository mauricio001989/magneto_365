require 'rails_helper'

describe Api::V1::FilmsController do
  # GET /api/v1/films
  describe 'GET #index' do
    subject(:http_request) { get :index, params: params }

    context 'when respond with all available films' do
      let(:film) { create_list(:film, 10) }
      let(:film_later_dates) do
        create_list(:film, 15, start_date: Time.zone.today + 20.days,
                               final_date: Time.zone.today + 25.days)
      end

      let(:params) {}

      before do
        film
        film_later_dates
        http_request
      end

      it 'responds with ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'count response film dispon' do
        expect(JSON(response.body).count).to eq(10)
      end
    end
  end

  # GET /api/v1/films/:date
  describe 'GET #show_films' do
    subject(:http_request) { get :show_films, params: params }

    context 'when respond with all available films for date' do
      let(:film) { create_list(:film, 10) }
      let(:film_later_dates) do
        create_list(:film, 15, start_date: Time.zone.today + 20.days,
                               final_date: Time.zone.today + 25.days)
      end

      let(:params) do
        { date: (Time.zone.today + 22.days).to_s }
      end

      before do
        film
        film_later_dates
        http_request
      end

      it 'responds with ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it "validate films available for date: #{Time.zone.today + 22.days}" do
        expect(JSON(response.body).count).to eq(15)
      end
    end
  end

  # POST /api/v1/films
  describe 'POST #create' do
    subject(:http_request) { post :create, params: params }

    let(:params) do
      {
        film: {
          name: 'rapido f',
          description: 'carros',
          url_image: 'www.image',
          start_date: '30-04-2020',
          final_date: '30-09-2020'
        }
      }
    end

    context 'when we create a valid film' do
      before do
        http_request
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end

      it 'responds the film created' do
        expect(response.body).to be_truthy
      end
    end

    context 'when the date is not valid ' do
      before 'update strar date of film' do
        params[:film][:start_date] = '30-10-2020'
        http_request
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when data is missing ' do
      before 'delete description' do
        params[:film].delete(:description)
        http_request
      end

      it 'responds with 400 status' do
        expect(http_request).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
