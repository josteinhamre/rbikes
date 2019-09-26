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

BikeDescriptions = [
  "Reliable, easy to ride commuter or leisure bike. Suitable for riding on the road or hard pack pathways. Extra Large 22 inch frame is perfect for taller riders with an inside leg measurement between 29 and 36 inches. The frame includes mounting points for a pannier rack and a bottle cage.",
  "This lovely city bike including basket which was bought separately has allowed me to cycle safely to wherever I have needed to go for many years and it has been serviced last month with no faults found.",
  "Frame size is Medium. This is not a standard spec bike as it has had upgrades. SRAM code R brakes with 180mm rear and 200mm front rotors. ",
  "The bike is in good working order, serviced annually at the local bike shop. Everything is as standard, with the exception of the pedals, which I changed to duel ones, so one side you can clip in (SPD mountain bike/ commuter 2 bolt cleats), or the other side is a standard flat pedal.",
  "2018 Cervelo Ultegra di2 in excellent condition, Campagnola Bullet 50 wheel set with Hutchinson tubeless tyres, size 58.", "Excellent condition, brand new tyres, recent service, bike has had very little light use and has been well cared for. Steel frame, Carbon forks, 18” frame/size medium.",
  "Rarely used, always kept indoor and well maintained. Tires and brakes changed last summer. Chain and all mechanical part just lubricated.", "Beautiful bike and it is with an extremely heavy heart I have to rent my bike due to temporarily illness. This has been meticulously serviced and looked after. Has probably only done less than about 1000km since purchase, due to me having heart issues I now need to a short break from cycling.",
  "Beautiful bike. Can be connected to you smartphone for a full riding experience. Great for Commuting and road rides. Can add navigation through your smart phone also keep track of your full ride ride through the E-bike motion website. www.ebikemotion.com.",
  "Great bike for a run around. Perfect to get you on road! Good quality brand in Boardman. Sram X-5 gears. Avid brakes. I've had a lot of fun with it- cycling locally to the gym or shops, some commuting and regular bigger cycles of. c 2 hours at weekends. Super versatile. Med size."]

 "Seeding..."
7.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "password"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.location = Faker::Address.city
  # profile_picture = "https://source.unsplash.com/500x500/?headshot"
  profile_picture = "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
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
    bike.description = BikeDescriptions.sample
    finn_url = scrape_finn_sykler(bike.brand)
    bike.remote_photo_url = finn_url
    bike.location = user.location
    bike.save!
    puts bike.brand
    puts "Bike saved..."
  end
end

bike = Bike.all
bike.each do |bike|
  (1..4).to_a.sample.times do
    booking = Booking.new
    booking.start_date = Date.today + ((1..100).to_a.sample)
    booking.end_date = booking.start_date + ((0..5).to_a.sample)
    booking.bike = bike
    booking.user = User.find((1..(User.count)).to_a.sample)
    booking.save
  end
end
puts "Seeding complete"

