class Reservation < ApplicationRecord
  belongs_to :user, dependent: :nullify
  belongs_to :film, dependent: :nullify
end
