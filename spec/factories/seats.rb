FactoryBot.define do
  factory :seat do
    seat_code { [*("A".."Z")].sample + %w[1 2].sample }
    seat_status { %i[seat_available on_hold booked].sample }
    bus_id { create(:bus).id }
    ticket_id { create(:ticket).id }
  end
end
