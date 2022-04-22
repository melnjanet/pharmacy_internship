class Account < ApplicationRecord
  validates :number, presence: true, uniqueness: true

  belongs_to :doctor
end
