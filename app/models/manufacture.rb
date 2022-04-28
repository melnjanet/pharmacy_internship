# == Schema Information
#
# Table name: manufactures
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Manufacture < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 3

  has_many :nomenclature
end
