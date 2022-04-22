class Nomenclature < ApplicationRecord
  validates :generic_name, presence: true
  validates :brand_name, presence: true
  validates :manufacturer, presence: true
  validates :dosage_form, presence: true
  validates :strength, presence: true
  validates :age, presence: true
  validates :prescription, presence: true
end
