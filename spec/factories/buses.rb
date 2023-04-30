FactoryBot.define do
  factory :bus do
    bus_code { Faker::Vehicle.singapore_license_plate }
    bus_type { %i[ac non_ac].sample }
    bus_company { Faker::Vehicle.manufacture }
    bus_capacity { Faker::Number.between(from: 1, to: 60) }
  end
end
