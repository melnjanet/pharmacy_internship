class User < ApplicationRecord
  validates :first_name, :last_name, :email, :age, presence: true
  validates :email, uniqueness: true

  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }

  has_many :recipes
  has_many :orders
end
