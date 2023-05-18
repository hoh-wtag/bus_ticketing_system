FactoryBot.define do
  factory :bus do
    code { Faker::Vehicle.singapore_license_plate }
    bus_type { %i[ac non_ac].sample }
    company { Faker::Vehicle.manufacture }
    capacity { Faker::Number.between(from: 1, to: 60) }
  end
end
