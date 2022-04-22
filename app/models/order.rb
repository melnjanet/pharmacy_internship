class Order < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :user
  has_one :recipe
end
