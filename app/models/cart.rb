# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_item_id  (item_id)
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
