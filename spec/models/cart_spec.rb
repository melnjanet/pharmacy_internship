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
require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { FactoryBot.create :cart }

  describe 'associations' do
    context 'when belong to items' do
      it { should belong_to(:user) }
    end
  end

  describe 'is created' do
    context 'when cart is create'
    it { expect(cart).to be_valid }
  end
end
