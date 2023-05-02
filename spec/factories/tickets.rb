FactoryBot.define do
  factory :ticket do
    total_fare { Faker::Number.between(from: 1, to: 1000) }

    user_id { create(:user).id }
    trip_id { create(:trip).id }
    bus_id { create(:bus).id }
    payment_id { create(:payment).id }
    boarding_id { create(:boarding).id }
  end
end
