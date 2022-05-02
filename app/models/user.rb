# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :first_name, :last_name, :email, :age, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email, uniqueness: true
  validates :age, numericality: { in: 18..65 }

  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }

  has_many :recipes, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart

  def full_name
    first_name + last_name
  end
end
