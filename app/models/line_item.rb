# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint
#  item_id    :bigint
#  order_id   :bigint
#
# Indexes
#
#  index_line_items_on_cart_id   (cart_id)
#  index_line_items_on_item_id   (item_id)
#  index_line_items_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (order_id => orders.id)
#
class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price * quantity
  end
end
