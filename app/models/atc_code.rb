# == Schema Information
#
# Table name: atc_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AtcCode < ApplicationRecord
  validates :code, :title, presence: true, uniqueness: true
  validates_length_of :title, minimum: 3

  has_many :nomenclatures, dependent: :destroy
end
