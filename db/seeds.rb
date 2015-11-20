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

restaurants = []
15.times do
  restaurants << Restaurant.create(name: Faker::Company.name, lng: rand(-100.00..100.00).round(4), lat: rand(-100.00..100.00).round(4))
end


users.each do |user|
  5.times do
    user.Photo.create(restaurant: restaurants[rand(0..9)]  user: user, stash_count: Rand(10), lng: rand(90), lat: rand(90))


  end
end


10.times do
  Foodtag.create(description: Faker::App.name)
end

10.times do
  Pricetag.create(price: rand(1.00..50.00).round(2))
end


