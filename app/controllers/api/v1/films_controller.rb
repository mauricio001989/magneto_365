module Api
  module V1
    class FilmsController < ApiController
      # GET /api/v1/films
      def index
        render json: list_films(Time.zone.today), each_serializer: FilmSerializer
      end

      # GET /api/v1/films/:date
      def show_films
        render json: list_films(date_param), each_serializer: FilmSerializer
      end

      # POST /api/v1/films
      def create
        result = Films::Create.call(film_param: film_param)
        render_result(result, :created, :unprocessable_entity)
      end

      private

      def film_param
        params.require(:film).permit(:name, :description, :url_image, :start_date, :final_date)
      end

      def date_param
        params.require(:date).to_date
      end

      def list_films(date)
        Film.where('start_date <= ? ', date.strftime('%F'))
            .where('final_date >= ? ', date.strftime('%F'))
      end
    end
  end
end
