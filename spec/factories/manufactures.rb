# == Schema Information
#
# Table name: manufactures
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :manufacture do
    name { Faker::Lorem.characters(number: 30) }
    created_at { DateTime.now() }
  end
end
