require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Creation' do
    let(:doctor) { FactoryBot.create :doctor }

    it 'is invalid without a first_name' do
      expect(FactoryBot.build :doctor, first_name: nil).not_to be_valid
    end

    it 'is invalid without a last_name' do
      expect(FactoryBot.build :doctor, last_name: nil).not_to be_valid
    end

    it 'is invalid without an email' do
      expect(FactoryBot.build :doctor, email: nil).not_to be_valid
    end

    it 'does not allow duplicate emails' do
      expect(FactoryBot.build :doctor, email: doctor.email).not_to be_valid
    end

    context 'when doctor is created' do
      it 'should be valid' do
        expect(doctor).to be_valid
      end
    end

    it 'has one account' do
      expect(doctor).to respond_to :account
    end

    it 'has many recipes' do
      expect(doctor).to respond_to :recipes
    end
  end
end
