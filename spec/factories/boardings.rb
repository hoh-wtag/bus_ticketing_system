FactoryBot.define do
  factory :boarding do
    trip
    boarding_point

    time { Faker::Time.between(from: trip.time, to: trip.time + 1, format: :default) }
  end
end
