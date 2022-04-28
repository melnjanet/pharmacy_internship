# == Schema Information
#
# Table name: generic_names
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe GenericName, type: :model do
  let(:generic_name) { FactoryBot.create :generic_name }

  context 'with title' do
    it { expect(generic_name).to validate_presence_of(:title) }
    it { expect(generic_name).to validate_uniqueness_of(:title) }
    it { expect(generic_name).to validate_length_of(:title).is_at_least(3) }
  end

  describe 'is created' do
    context 'when generic_name is created'
    it { expect(generic_name).to be_valid }
  end
end
