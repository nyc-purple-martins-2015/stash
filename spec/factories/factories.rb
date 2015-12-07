FactoryGirl.define do
  factory(:user) do
    provider { Faker::Company.name }
    uid { Faker::Number.number(6) }
    name { Faker::Name.name }
  end
end

FactoryGirl.define do
  factory(:foodtag) do
    description { Faker::Name.name }
  end
end

FactoryGirl.define do
  factory(:foodtag_photo) do
    photo
    foodtag
  end
end

FactoryGirl.define do
  factory(:pricetag) do
    price ["$", "$$", "$$$", "$$$$"].sample
  end
end

