# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:country) { FactoryBot.create :country }

  describe 'creation' do
    context 'with name' do
      it { expect(country).to validate_presence_of(:name) }
      it { expect(country).to validate_uniqueness_of(:name) }
      it { expect(country).to validate_length_of(:name).is_at_least(3) }
    end
  end

  describe 'is created' do
    context 'when country is created'
    it { expect(country).to be_valid }
  end
end
