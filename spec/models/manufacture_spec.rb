# == Schema Information
#
# Table name: manufactures
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Manufacture, type: :model do
  let(:manufacture) { FactoryBot.create :manufacture }

  describe 'creation' do
    context 'with name' do
      it { expect(manufacture).to validate_presence_of(:name) }
      it { expect(manufacture).to validate_uniqueness_of(:name) }
      it { expect(manufacture).to validate_length_of(:name).is_at_least(3) }
    end
  end

  describe 'is created' do
    context 'when manufacture is created'
    it { expect(manufacture).to be_valid }
  end
end
