FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    user_name { "MyString" }
    encrypted_password { "MyString" }
    phone { "MyString" }
    role { 1 }
  end
end
