class ReservationSerializer < ActiveModel::Serializer
  belongs_to :film, serializer: BaseFilmSerializer
  belongs_to :user, serializer: UserSerializer
end
