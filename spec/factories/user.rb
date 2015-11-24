FactoryGirl.define do
  factory(:user) do
    provider { Faker::Company.name }
    uid { Faker::Number.number(6) }
    name { Faker::Name.name }
  end
end

