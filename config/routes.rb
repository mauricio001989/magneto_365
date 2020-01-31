# frozen_string_literal: true

Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :films, only: %i[create index] do
      collection do
        get '/:date', to: 'films#show_films'
      end
    end

    resources :reservations, only: %i[create index]
  end
end
