FactoryGirl.define do
  factory(:foodtag) do
    description { Faker::Name.name }
  end
end
