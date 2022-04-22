FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    age { Faker::Number.number(digits: 3) }
    active { Faker::Boolean.boolean }
    created_at { DateTime.now }
  end
end
