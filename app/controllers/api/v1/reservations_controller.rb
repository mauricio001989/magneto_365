module Api
  module V1
    class ReservationsController < ApiController
      def create
        result = Reservations::Create.call(film_param: film_param, user_param: user_param)

        render_result(result, :created, :unprocessable_entity)
      end

      def index
        render json: Reservation.all.includes(:user, :film), each_serializer: ReservationSerializer
      end

      private

      def user_param
        params.require(:user).permit(:name, :email, :id_document, :phone)
      end

      def film_param
        params.require(:id_film)
      end
    end
  end
end
