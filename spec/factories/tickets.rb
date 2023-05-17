FactoryBot.define do
  factory :ticket do
    total_fare { Faker::Number.between(from: 1, to: 1000) }

    user
    trip
    bus
    payment
    boarding
  end
end
