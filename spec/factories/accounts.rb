# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  amount     :float
#  expiry     :date
#  number     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#
# Indexes
#
#  index_accounts_on_admin_id  (admin_id)
#
FactoryBot.define do
  factory :account do
    admin

    number { Faker::Bank.account_number }
    amount { Faker::Number.decimal }
    expiry { Faker::Date.forward(days: 360) }
    created_at { DateTime.now() }
  end
end
