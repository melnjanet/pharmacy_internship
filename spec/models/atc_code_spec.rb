# == Schema Information
#
# Table name: atc_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe AtcCode, type: :model do
  let(:atc_code) { FactoryBot.create :atc_code }

  describe 'creation' do
    context 'with code' do
      it { expect(atc_code).to validate_presence_of(:code) }
      it { expect(atc_code).to validate_uniqueness_of(:code) }
    end

    context 'with title' do
      it { expect(atc_code).to validate_presence_of(:title) }
      it { expect(atc_code).to validate_uniqueness_of(:title) }
      it { expect(atc_code).to validate_length_of(:title).is_at_least(3) }
    end
  end

  describe 'is created' do
    context 'when atc_code is created'
    it { expect(atc_code).to be_valid }
  end
end
