class User < ApplicationRecord
  has_many :reservations

  validates :name, :email, :id_document, :phone, presence: true
end
