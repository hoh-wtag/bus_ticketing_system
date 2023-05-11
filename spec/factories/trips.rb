FactoryBot.define do
  factory :trip do
    ticket_price { Faker::Number.between(from: 1, to: 10_000) }
    date { Faker::Date.between(from: "2023-05-01", to: "2024-05-01") }
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }

    bus_id { create(:bus).id }
    route_id { create(:route).id }
  end
end
