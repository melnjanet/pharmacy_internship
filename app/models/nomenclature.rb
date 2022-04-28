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
class Nomenclature < ApplicationRecord
  validates :brand_name, :dosage_form, :package_size, :package_units, :prescription,
            :age_group, presence: true
  validates :brand_name, uniqueness: true
  validates_length_of :brand_name, minimum: 3

  belongs_to :country
  belongs_to :atc_code
  belongs_to :manufacture
  belongs_to :generic_name

  enum age_group: { child: 0, adult: 1 }
  enum dosage_form: { tablet: 0, capsules: 1 }
  enum package_units: { tbl: 0, ml: 1 }
  enum strength_units: { mg: 0, mg_ml: 1 }
end
