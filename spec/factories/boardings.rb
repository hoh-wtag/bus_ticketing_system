FactoryBot.define do
  factory :boarding do
    boarding_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end
