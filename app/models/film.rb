class Film < ApplicationRecord
  has_many :reservations

  validates :name, :description, :url_image, :start_date, :final_date, presence: true
end
