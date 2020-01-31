# TODO: update faker in productions

puts'create user'
5.times do
  User.create(name: Faker::Name.name,
              id_document: Faker::Number.number(digits: 7),
              email: Faker::Internet.email,
              phone: Faker::Number.number(digits: 10))
end

puts 'create films'
5.times do
  Film.create(name: Faker::Game.title,
              description: Faker::Movies::BackToTheFuture.quote,
              url_image: Faker::Fillmurray.image,
              start_date: Date.today,
              final_date: Date.today + 5.day)
end

puts 'create reservation'
Reservation.create(user: User.last, film: Film.last)
Reservation.create(user: User.second, film: Film.second)
