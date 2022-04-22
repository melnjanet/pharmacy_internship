FactoryBot.define do
  factory :order do
    user

    quantity { Faker::Number.number(digits: 3) }
    created_at { DateTime.now }
  end
end
