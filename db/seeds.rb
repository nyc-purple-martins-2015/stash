# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

matt = User.create(provider: "stash", uid: "123", name: "matt", oauth_token: "what?", oauth_expires_at: '2020-05-06')

nick = User.create(provider: "stash", uid: "456", name: "nick", oauth_token: "who?", oauth_expires_at: '2020-05-08')

rachel = User.create(provider: "facebook", uid: "246", name: "rachel", oauth_token: "when?", oauth_expires_at: '2021-05-06')

june = User.create(provider: "etsy", uid: "234", name: "june", oauth_token: "why?", oauth_expires_at: '2020-06-06')

users = [matt, nick, rachel, june]

photos = []
restaurants = []

15.times do
  restaurants << Restaurant.create(name: Faker::Company.name, lng: rand(-100.00..100.00).round(4), lat: rand(-100.00..100.00).round(4))
end

photo_collection = ['burger.jpg', 'fish.jpg', 'spaghetti.jpg', 'pretzel.jpg', 'sushi.jpg']

users.each do |user|
  5.times do
   photos << Photo.create(restaurant: restaurants[rand(0..14)],
    user: user, lng: rand(90), lat: rand(90),
    image: File.new(Rails.root.join('seed_photos', photo_collection.sample)))
  end
end

photos.each do |photo|
  3.times do
   photo.foodtags << Foodtag.find_or_create_by(description: Faker::App.name)
  end
end


pricetags = ['$', '$$', '$$$', '$$$$']

pricetags.map! { |tag| Pricetag.create(price: tag) }

# photos.each do |photo|
#   photo.pricetag = Pricetag.find(rand(1..4))
# end

# price_tags = Pricetag.all

# price_tags.each do |tag|
#   PhotoPricetag.create(pricetag: tag, photo: rand(1..(Photo.all.count)))
# end

# users.each do |user|
#   stash = Stash.create(user: user)
#   5.times { stash.photos << Photo.find(rand(1..20))}
# end


