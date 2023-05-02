FactoryBot.define do
  factory :boarding do
    boarding_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    trip_id { create(:trip).id }
    boarding_point_id { create(:boarding_point).id }
  end
end
