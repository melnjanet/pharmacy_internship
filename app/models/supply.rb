class Supply < ApplicationRecord
  validates :quantity, :measure, :price, :amount, presence: true

  has_many  :nomenclatures
  has_many :recipes
  belongs_to :pharmacist
end
