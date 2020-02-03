puts'create user'
Rake::Task['db:upload_user:create'].invoke

puts 'create films'
Rake::Task['db:upload_films:create'].invoke

puts 'create reservation'
10.times do
  Reservation.create(user: User.order('RANDOM()').first, film: Film.last)
end
