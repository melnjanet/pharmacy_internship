require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Creation' do
    let(:recipe) { FactoryBot.create :recipe }

    it 'is invalid without a number' do
      expect(FactoryBot.build :recipe, number: nil).not_to be_valid
    end

    it 'does not allow duplicate number' do
      expect(FactoryBot.build :recipe, number: recipe.number).not_to be_valid
    end

    it 'is invalid without a quantity' do
      expect(FactoryBot.build :recipe, quantity: nil).not_to be_valid
    end

    it 'is invalid without a age' do
      expect(FactoryBot.build :recipe, age: nil).not_to be_valid
    end

    it 'is invalid without a expiry' do
      expect(FactoryBot.build :recipe, expiry: nil).not_to be_valid
    end

    context 'when recipe is created' do
      it 'should be valid' do
        expect(recipe).to be_valid
      end
    end

    it 'is expected to belong to user' do
      expect(belong_to :user)
    end

    it 'is expected to belong to doctor' do
      expect(belong_to :doctor)
    end

    it 'is expected to belong to supply' do
      expect(belong_to :supply)
    end
  end
end
