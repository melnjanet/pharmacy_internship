class Nomenclature < ApplicationRecord
  validates :generic_name, :brand_name, :manufacturer, :dosage_form, :strength, :age,  presence: true
end
