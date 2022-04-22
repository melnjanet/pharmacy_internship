require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Creation' do
    let(:account) { FactoryBot.create :account }

    it 'is expected to belong to doctor' do
      expect(belong_to :doctor)
    end

    it 'is invalid without an account number' do
      expect(FactoryBot.build :account, number: nil).not_to be_valid
    end

    it 'does not allow duplicate account number' do
      expect(FactoryBot.build :account, number: account.number).not_to be_valid
    end

    context 'when account is created' do
      it 'should be valid' do
        expect(account).to be_valid
      end
    end
  end
end
