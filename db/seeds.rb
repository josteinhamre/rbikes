# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'nokogiri'

def scrape_finn_sykler(brand)
  # TODO: return an array of Antiques found of Craiglist for this `city`.
  html_content = open("https://www.finn.no/bap/forsale/search.html?category=0.69&product_category=2.69.3963.257&q=#{brand}").read
  doc = Nokogiri::HTML(html_content)
  count = doc.search('div img').count
  doc.search('div img')[(1..([count, 20].min)).to_a.sample]['src']

end


BikeDescriptions = ["Bikes/o9abnqonczwr0obqcvv1.jpg", "Bikes/dp83zthl0qbh2riu3gld.jpg", "Bikes/z8ifc0wph9wd39tvs4h0.jpg", "Bikes/sggegv7cgddflq7bukkw.jpg", "Bikes/qdp07a9cvys12nplc4vz.jpg", "Bikes/tqpv2keeszajzdlch3r5.jpg", "Bikes/jqgq41qdfijty6scvaz2.jpg", "Bikes/bdoxu0z7rgv3clbf3ylx.jpg", "Bikes/x9n9lpx5umkytrandv3u.jpg", "Bikes/ontxbkfodulofmyxsgqp.jpg", "Bikes/stmztbucpjcardauvcwd.jpg", "Bikes/xzm5mqc7dskpqkpuodrz.jpg", "Bikes/fsb02fmtal0b1a2fgcph.jpg", "Bikes/mwuzvqp5hetyqtpz0qbv.jpg", "Bikes/xu0emfbofhfkd8ovoffe.jpg", "Bikes/tuongritzbrumf8dicoq.jpg", "Bikes/jdq5wi9pc7sb1zvnfvs2.jpg", "Bikes/w5z1loiktkcdn9yh40in.jpg", "Bikes/lrwavskarxhbqxoly9x4.jpg", "Bikes/iedfs5xnqacu6ewcdf1l.jpg",]
puts "Seeding..."
7.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "password"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.location = Faker::Address.city
  profile_picture = "https://source.unsplash.com/500x500/?headshot"
  user.remote_profile_picture_url = profile_picture
  user.save!
  puts "User saved..."
  puts "Creating bikes for user..."
  3.times do
    bike = Bike.new
    bike.user = user
    bike.model = Faker::ElectricalComponents.active
    bike.brand = %w[Pinarello Trek Merckx BMC Cervelo Specialized Giant Focus Salsa Cannondale Felt Bianchi Merida Scott].sample
    bike.production_year = (2000..2019).to_a.sample
    bike.price = (200..600).to_a.sample.round(-1)
    bike.color = Faker::Color.color_name
    bike.bike_type = Bike::TYPE.sample
    bike.description = BikeDescriptions.to_a.sample
    finn_url = scrape_finn_sykler(bike.brand)
    bike.remote_photo_url = finn_url
    bike.location = user.location
    bike.save!
    puts bike.brand
    puts "Bike saved..."
  end
end
puts "Seeding complete"

