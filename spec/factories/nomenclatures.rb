FactoryBot.define do
  factory :nomenclature do
    generic_name { Faker::String.random }
    brand_name { Faker::String.random }
    manufacturer { Faker::Company.name }
    dosage_form { Faker::Number.number(digits: 3) }
    strength { Faker::String.random(length: 3..12) }
    age { Faker::Number.between(from: 0, to: 1) }
    prescription { Faker::Boolean.boolean }
    description { Faker::Lorem.paragraphs }
    created_at { DateTime.now }
  end
end