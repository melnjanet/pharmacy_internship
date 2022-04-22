class Doctor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one :account, dependent: :destroy
  has_many :recipes
end
