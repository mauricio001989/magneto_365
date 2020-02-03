namespace :db do
  namespace :upload_films do
    desc 'Upload data'

    task create: :environment do
        
      File.open('db/seeds/files/users.txt', 'r') do |file|
        file.readlines.each do |line|
          line = line.delete("\n")
          name = line.split(',')[0]
          email = line.split(',')[1]
          id_document = line.split(',')[2]
          phone = line.split(',')[3]
          create_user(name: name, email: email, id_document: id_document, phone: phone)
        end
      end
    end

    def create_user(name: '', email: '', id_document: '', phone: '')
      user = User.new(name: name, email: email, id_document: id_document, phone: phone)

      if user.valid?
        user.save
      else
        faild_user("#{name}, #{email}, #{id_document}, #{phone}")
      end
    end

    def faild_user(user)
      file = File.open('db/seeds/fails_file/fails_user.txt', 'r').read
      File.open('db/seeds/fails_file/fails_user.txt', 'w') do |file_error|
        file_error.puts "#{file} #{user}"
      end
    end
  end
end
