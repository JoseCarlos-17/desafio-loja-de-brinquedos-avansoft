FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "MyString#{n}" }
    birthdate { "1999-12-31" }
    sequence(:email) { |n| "mystring#{n}@email.com" }
    password { "123123123" }
    password_confirmation { "123123123" }
  end
end
  