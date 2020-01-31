class FilmSerializer < BaseFilmSerializer
  attributes :description, :url_image, :start_date, :final_date, :free_chair

  def free_chair
    object.reservation?
  end
end
