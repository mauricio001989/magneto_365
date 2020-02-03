namespace :db do
  namespace :upload_user do
    desc 'Upload data'

    task create: :environment do
      File.open('db/seeds/files/films.txt', 'r') do |file|
        file.readlines.each do |line|
          line = line.delete("\n")

          name = line.split(',')[0]
          description = line.split(',')[1]
          url_image = line.split(',')[2]
          start_date = line.split(',')[3]
          final_date = line.split(',')[4]
          create_film(name: name, description: description, url_image: url_image, start_date: start_date, final_date: final_date)
        end
      end
    end

    def create_film(name: '', description: '', url_image: '', start_date: '', final_date: '')
      film = Film.new(name: name, description: description, url_image: url_image, start_date: start_date, final_date: final_date)

      if film.valid?
        film.save
      else
        faild_film("#{name}, #{description}, #{url_image}, #{start_date}, #{final_date}")
      end
    end

    def faild_film(film)
      file = File.open('db/seeds/fails_file/fails_films.txt', 'r').read
      File.open('db/seeds/fails_file/fails_films.txt', 'w') do |file_error|
        file_error.puts "#{file} #{film}"
      end
    end
  end
end
