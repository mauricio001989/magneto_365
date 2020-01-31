module Films
  class Create
    include Interactor

    def call
      # TODO: implement i18n for translate

      context.fail!(errors: 'fechas no validos') unless valid_date?
      context.output = new_film if new_film.save
    end

    private

    delegate :film_param, to: :context

    def new_film
      @new_film ||= Film.new(film_param)
    end

    def valid_date?
      new_film.start_date <= new_film.final_date
    end
  end
end
