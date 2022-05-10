# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  role       :integer          default("super_admin"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Admin < ApplicationRecord
  validates :first_name, :last_name, :email, :age, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email, uniqueness: true
  validates :age, numericality: { in: 18..65 }

  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }

  has_many :recipes, dependent: :destroy
  has_many :items, dependent: :destroy

  enum role: { admin: 0, pharmacist: 1, physician: 2 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
