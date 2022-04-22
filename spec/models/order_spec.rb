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

    it 'has one recipe' do
      expect(order).to respond_to :recipe
    end

    it 'is expected to belong to user' do
      expect(belong_to :user)
    end
  end
end
