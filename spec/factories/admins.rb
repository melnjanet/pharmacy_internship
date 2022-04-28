# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  role       :integer          default("super_admin"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :admin do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    age { Faker::Number.number(digits: 3) }
    active { Faker::Boolean.boolean }
    created_at { DateTime.now }
  end
end
