# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  amount     :float
#  expiry     :date
#  number     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#
# Indexes
#
#  index_accounts_on_admin_id  (admin_id)
#
require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { FactoryBot.create :account }

  describe 'creation' do
    context 'with number' do
      it { expect(account).to validate_presence_of(:number) }
      it { expect(account).to validate_uniqueness_of(:number) }
    end
  end

  describe 'with created' do
    context 'when account is created'
    it { expect(account).to be_valid }
  end

  describe 'associations' do
    context 'when belong to admin' do
      it { should belong_to(:admin) }
    end
  end
end
