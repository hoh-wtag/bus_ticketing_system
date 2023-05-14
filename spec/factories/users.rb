FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    user_name { Faker::Name.first_name }
    phone { Faker::Base.numerify("+8801#########") }
    password do
      Faker::Internet.password(min_length: 8, max_length: 40, mix_case: true, special_characters: true)
    end
  end
end
