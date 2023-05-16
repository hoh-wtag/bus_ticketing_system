FactoryBot.define do
  factory :ticket do
    total_fare { Faker::Number.between(from: 1, to: 1000) }

    user { create(:user) }
    trip { create(:trip) }
    bus { create(:bus) }
    payment { create(:payment) }
    boarding { create(:boarding) }
  end
end
