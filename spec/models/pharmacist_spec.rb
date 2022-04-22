require 'rails_helper'

RSpec.describe Pharmacist, type: :model do
  describe 'Creation' do
    let(:pharmacist) { FactoryBot.create :pharmacist }

    it 'is invalid without a first_name' do
      expect(FactoryBot.build :pharmacist, first_name: nil).not_to be_valid
    end

    it 'is invalid without a last_name' do
      expect(FactoryBot.build :pharmacist, last_name: nil).not_to be_valid
    end

    it 'is invalid without an email' do
      expect(FactoryBot.build :pharmacist, email: nil).not_to be_valid
    end

    it 'does not allow duplicate emails' do
      expect(FactoryBot.build :pharmacist, email: pharmacist.email).not_to be_valid
    end

    context 'when pharmacist is created' do
      it 'should be valid' do
        expect(pharmacist).to be_valid
      end
    end
  end
end
