# == Schema Information
#
# Table name: atc_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :atc_code do
    code { Faker::Lorem.characters(number: 5) }
    title { Faker::Lorem.characters(number: 30) }
    created_at { DateTime.now() }
  end
end
