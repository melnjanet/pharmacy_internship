FactoryBot.define do
  factory :account do
    doctor

    number { Faker::Bank.account_number }
    amount { Faker::Number.decimal }
    expiry { Faker::Date.forward(days: 360) }
  end
end
