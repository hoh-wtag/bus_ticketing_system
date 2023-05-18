FactoryBot.define do
  factory :boarding_point do
    name { Faker::Address.city }
  end
end
