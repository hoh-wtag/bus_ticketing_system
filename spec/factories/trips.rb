FactoryBot.define do
  factory :trip do
    ticket_price { 1 }
    total_booked { 1 }
    trip_date { "2023-05-01" }
    trip_time { "2023-05-01 10:36:49" }
  end
end
