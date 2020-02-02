module Reservations
  class Create
    include Interactor

    def call
      # TODO: implement i18n for translate
      context.fail!(errors: 'no se pueden hacer mas reservas') unless validations?

      reservation.save
      context.output = reservation
    end

    private

    delegate :film_param, :user_param, to: :context

    def film
      @film ||= Film.find(film_param)
    end

    def reservation
      Reservation.new(user: user, film: film)
    end

    def user
      @user = User.new(user_param)
      if User.find_by(id_document: @user.id_document).present?
        @user = User.find_by(id_document: @user.id_document)
      else
        @user.save
      end

      @user
    end

    def validations?
      film.reservations.count < 10 && user.valid?
    end
  end
end
