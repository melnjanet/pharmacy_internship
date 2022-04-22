class Recipe < ApplicationRecord
  validates :number, :quantity, :age, :expiry,  presence: true
  validates :number, uniqueness: true

  belongs_to :doctor
  belongs_to :user
  belongs_to :supply
end
