FactoryBot.define do
  factory :boarding do
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    trip { create(:trip) }
    boarding_point { create(:boarding_point) }
  end
end
