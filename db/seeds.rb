# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding..."
10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "password"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.location = Faker::Address.city
  user.profile_picture = Faker::LoremFlickr.image(size: "300x300", search_terms: ['portrait'])
  user.save!
  puts "User saved..."
  puts "Creating bikes for user..."
  5.times do
    bike = Bike.new
    bike.user = user
    bike.model = Faker::ElectricalComponents.active
    bike.brand = %w[Pinarello Trek Merckx BMC Cervelo Specialized Giant Focus Salsa Cannondale Felt Bianchi Merida Scott].sample
    bike.production_year = (2000..2019).to_a.sample
    bike.color = Faker::Color.color_name
    bike.type = Bike::TYPE.sample
    bike.description = Faker::Lorem.sentences(number: 2)
    bike.photo = Faker::LoremFlickr.image(size: "500x300", search_terms: ['bicycle', "#{bike.brand}"], match_all: true)
    bike.location = user.location
    bike.save!
    puts bike.brand
    puts "Bike saved..."
  end
end
puts "Seeding complete"
