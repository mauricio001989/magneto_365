class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :email, :id_document, :phone, presence: true
end
