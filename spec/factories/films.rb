FactoryBot.define do
  factory :film do
    name { Faker::Game.title }
    description { Faker::Movies::BackToTheFuture.quote }
    url_image { Faker::Fillmurray.image }
    start_date { Date.today }
    final_date { Date.today + 5.day }
  end
end
