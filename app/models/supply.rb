class Supply < ApplicationRecord
  validates :quantity, presence: true
  validates :measure, presence: true
  validates :price, presence: true
  validates :amount, presence: true

  has_many  :nomenclatures
  has_many :recipes
  belongs_to :pharmacist
end
