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
require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:line_item) { FactoryBot.create :line_item }

  describe 'with created' do
    context 'when line_items is created'
    it { expect(line_item).to be_valid }
  end

  describe 'associations' do
    context 'when belong to cart' do
      it { should belong_to(:cart) }
    end

    context 'when belong to admin' do
      it { should belong_to(:item) }
    end

    context 'when belong to admin' do
      it { should belong_to(:order) }
    end
  end
end
