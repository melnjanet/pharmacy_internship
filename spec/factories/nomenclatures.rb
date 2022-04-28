# == Schema Information
#
# Table name: nomenclatures
#
#  id              :bigint           not null, primary key
#  age_group       :integer          default("adult")
#  brand_name      :string
#  description     :text
#  dosage_form     :integer          default("tablet")
#  package_size    :integer
#  package_units   :integer          default("tbl"), not null
#  prescription    :boolean          default(FALSE), not null
#  strength        :integer
#  strength_units  :integer          default("mg"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  atc_code_id     :bigint
#  country_id      :bigint
#  generic_name_id :bigint
#  manufacture_id  :bigint
#
# Indexes
#
#  index_nomenclatures_on_atc_code_id      (atc_code_id)
#  index_nomenclatures_on_country_id       (country_id)
#  index_nomenclatures_on_generic_name_id  (generic_name_id)
#  index_nomenclatures_on_manufacture_id   (manufacture_id)
#
FactoryBot.define do
  factory :nomenclature do
    country
    atc_code
    manufacture
    generic_name

    brand_name { Faker::Lorem.characters(number: 30) }
    strength { Faker::Number.number(digits: 3) }
    package_size { Faker::Number.number(digits: 3) }
    prescription { false || true }
    created_at { DateTime.now }
  end
end
