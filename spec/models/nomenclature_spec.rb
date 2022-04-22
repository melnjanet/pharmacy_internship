require 'rails_helper'

RSpec.describe Nomenclature, type: :model do
  describe 'Creation' do
    let(:nomenclature) { FactoryBot.create :nomenclature }

    it 'is invalid without a generic name' do
      expect(FactoryBot.build :nomenclature, generic_name: nil).not_to be_valid
    end

    it 'is invalid without a brand name' do
      expect(FactoryBot.build :nomenclature, brand_name: nil).not_to be_valid
    end

    it 'is invalid without an manufacturer' do
      expect(FactoryBot.build :nomenclature, manufacturer: nil).not_to be_valid
    end

    it 'is invalid without an dosage_form' do
      expect(FactoryBot.build :nomenclature, dosage_form: nil).not_to be_valid
    end

    it 'is invalid without an strength' do
      expect(FactoryBot.build :nomenclature, strength: nil).not_to be_valid
    end

    it 'is invalid without an age' do
      expect(FactoryBot.build :nomenclature, age: nil).not_to be_valid
    end

    context 'when nomenclature is created' do
      it 'should be valid' do
        expect(nomenclature).to be_valid
      end
    end
  end
end
