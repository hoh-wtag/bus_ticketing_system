FactoryBot.define do
  factory :boarding_point do
    boarding_point_name { Faker::Address.city }
  end
end
