# == Schema Information
#
# Table name: generic_names
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GenericName < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates_length_of :title, minimum: 3

  has_many :nomenclatures, dependent: :destroy
end
