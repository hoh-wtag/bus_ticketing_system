FactoryBot.define do
  factory :route do
    source { Faker::Address.city }
    destination { Faker::Address.city }
  end
end
