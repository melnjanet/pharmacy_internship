class Doctor < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_one :account, dependent: :destroy
  has_many :recipes
end
