FactoryBot.define do
  factory :trip do
    ticket_price { Faker::Number.between(from: 1, to: 10_000) }
    total_booked { Faker::Number.between(from: 1, to: 60) }
    trip_date { Faker::Date.between(from: "2023-05-01", to: "2024-05-01") }
    trip_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end
