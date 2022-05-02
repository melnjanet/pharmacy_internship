# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  age_group  :integer          default("adult"), not null
#  expiry     :date
#  number     :string
#  quantity   :integer          default(1), not null
#  used       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#  item_id    :bigint
#  order_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_recipes_on_admin_id  (admin_id)
#  index_recipes_on_item_id   (item_id)
#  index_recipes_on_order_id  (order_id)
#  index_recipes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Recipe < ApplicationRecord
  validates :number, :quantity, :age_group, :expiry, presence: true
  validates :number, uniqueness: true
  validates_numericality_of :quantity, greater_than: 0

  belongs_to :admin
  belongs_to :user
  belongs_to :order
  belongs_to :item

  enum age_group: { child: 0, adult: 1 }
end
