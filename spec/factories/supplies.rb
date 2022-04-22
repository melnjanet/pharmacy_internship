FactoryBot.define do
  factory :supply do
    pharmacist

    quantity { Faker::Number.number(digits: 3) }
    measure { Faker::String.random(length: 3..12) }
    price { Faker::Number.number(digits: 3) }
    amount {Faker::Number.number(digits: 3)}
    reservation_quantity { Faker::Number.number(digits: 3) }
    created_at {DateTime.now}
  end
end
