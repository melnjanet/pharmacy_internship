require 'rails_helper'

RSpec.describe Supply, type: :model do
  describe 'Creation' do
    let(:supply) { FactoryBot.create :supply }

    it 'is invalid without a quantity' do
      expect(FactoryBot.build :supply, quantity: nil).not_to be_valid
    end

    it 'is invalid without a measure' do
      expect(FactoryBot.build :supply, measure: nil).not_to be_valid
    end

    it 'is invalid without a quantity' do
      expect(FactoryBot.build :supply, price: nil).not_to be_valid
    end

    it 'is invalid without a amount' do
      expect(FactoryBot.build :supply, amount: nil).not_to be_valid
    end

    context 'when supply is created' do
      it 'should be valid' do
        expect(supply).to be_valid
      end
    end

    it { should belong_to(:pharmacist) }
  end
end
