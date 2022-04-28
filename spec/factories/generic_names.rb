# == Schema Information
#
# Table name: generic_names
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :generic_name do
    title { Faker::Lorem.characters(number: 30) }
  end
end
