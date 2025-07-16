FactoryBot.define do
  factory :admin do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:email) { |n| "mystring#{n}@email.com" }
    password { "123123123" }
    password_confirmation { "123123123" }
  end
end
    