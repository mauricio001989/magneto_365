FactoryBot.define do
  factory :film do
    name { Faker::Game.title }
    description { Faker::Movies::BackToTheFuture.quote }
    url_image { Faker::Fillmurray.image }
    start_date { Time.zone.today }
    final_date { Time.zone.today + 5.days }
  end
end
