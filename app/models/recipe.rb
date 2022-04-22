class Recipe < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :age, presence: true
  validates :expiry, presence: true
  validates :quantity, presence: true


  belongs_to :doctor
  belongs_to :user
  belongs_to :supply
end
