require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creation' do
    let(:user) { FactoryBot.create :user }

    it 'is invalid without a first_name' do
      expect(FactoryBot.build :user, first_name: nil).not_to be_valid
    end

    it 'is invalid without a last_name' do
      expect(FactoryBot.build :user, last_name: nil).not_to be_valid
    end

    it 'is invalid without an email' do
      expect(FactoryBot.build :user, email: nil).not_to be_valid
    end

    it 'does not allow duplicate emails' do
      expect(FactoryBot.build :user, email: user.email).not_to be_valid
    end

    it 'is invalid without an age' do
      expect(FactoryBot.build :user, age: nil).not_to be_valid
    end

    context 'when user is created' do
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    it 'has many recipe' do
      expect(user).to respond_to :recipes
    end

    it 'has many orders' do
      expect(user).to respond_to :orders
    end
  end
end
