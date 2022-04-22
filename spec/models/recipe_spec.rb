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

    it { should define_enum_for(:age) }

    it { should belong_to(:user) }
    it { should belong_to(:doctor) }
    it { should belong_to(:supply) }
  end
end
