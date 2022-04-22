FactoryBot.define do
  factory :recipe do
    user
    doctor
    supply

    number { Faker::String }
    quantity { Faker::Number.number(digits: 3) }
    age { Faker::Number.decimal_part(digits: 1) }
    expiry { Faker::Date.forward(days: 31) }
    comments { Faker::Lorem.paragraph }
    used { Faker::Boolean.boolean }
    created_at {DateTime.now}
  end
end
