# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  describe 'creation' do
    context 'with first_name' do
      it { expect(user).to validate_presence_of(:first_name) }
    end

    context 'with last_name' do
      it { expect(user).to validate_presence_of(:last_name) }
    end

    context 'with email' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_uniqueness_of(:email) }
    end

    context 'with age' do
      it { expect(user).to validate_presence_of(:age) }
    end
  end

  describe 'associations' do
    context 'when belong to orders' do
      it { should have_many(:orders) }
    end

    context 'when belong to recipes' do
      it { should have_many(:recipes) }
    end
  end

  context 'is created' do
    context 'when user is created'
    it { expect(user).to be_valid }
  end
end
