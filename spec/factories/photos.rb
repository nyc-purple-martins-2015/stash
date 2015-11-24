FactoryGirl.define do
  factory(:photo) do
    dish_name { Faker::App.name }
    # image { Rack::Test::UploadedFile.new(Rails.root.join('seed_photos', 'fish.jpg'), 'image/jpeg') }
    lng  { Faker::Number.decimal(2,4) }
    lat  { Faker::Number.decimal(2,6) }
    foodtags { Faker::App.name }
    user
  end
end



