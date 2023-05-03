FactoryBot.define do
  factory :seat do
    seat_code { [*("A".."Z")].sample + %w[1 2].sample }
    seat_status { %i[seat_available on_hold booked].sample }
    trip_id { create(:trip).id }
    ticket_id { create(:ticket).id }
  end
end
