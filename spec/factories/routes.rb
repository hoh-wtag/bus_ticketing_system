FactoryBot.define do
  factory :route do
    route_source {Faker::Address.city}
    route_destination {Faker::Address.city}
  end
end