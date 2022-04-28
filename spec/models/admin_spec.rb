# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  age        :integer
#  email      :string
#  first_name :string
#  last_name  :string
#  role       :integer          default("super_admin"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryBot.create :admin }

  describe 'creation' do
    context 'with first_name' do
      it { expect(admin).to validate_presence_of(:first_name) }
    end

    context 'with last_name' do
      it { expect(admin).to validate_presence_of(:last_name) }
    end

    context 'with email' do
      it { expect(admin).to validate_presence_of(:email) }
      it { expect(admin).to validate_uniqueness_of(:email) }
    end

    context 'with role' do
      it { expect(admin).to define_enum_for(:role) }
    end
  end

  describe 'associations' do
    context 'when belong to items' do
      it { should have_many(:items) }
    end

    context 'when belong to recipes' do
      it { should have_many(:recipes) }
    end
  end

  describe 'is created' do
    context 'when account is created'
    it { expect(admin).to be_valid }
  end
end
