FactoryBot.define do
  factory :seat do
    code { [*('A'..'Z')].sample + %w[1 2].sample }
    status { %i[seat_available on_hold booked].sample }
    trip { create(:trip) }
    ticket { create(:ticket) }
  end
end
