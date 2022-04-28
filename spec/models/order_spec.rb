# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  comment      :text
#  quantity     :integer          default(1), not null
#  state        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_item_id :bigint
#  recipe_id    :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_orders_on_line_item_id  (line_item_id)
#  index_orders_on_recipe_id     (recipe_id)
#  index_orders_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Creation' do
    let(:order) { FactoryBot.create :order }

    it 'is invalid without a quantity' do
      expect(FactoryBot.build :order, quantity: nil).not_to be_valid
    end

    context 'when order is created' do
      it 'should be valid' do
        expect(order).to be_valid
      end
    end

    it { should belong_to(:user) }
    it { should have_one(:recipe) }
  end
end
