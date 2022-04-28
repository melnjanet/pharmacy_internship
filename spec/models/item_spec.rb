# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  price           :decimal(8, 2)
#  quantity        :integer          default(1), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin_id        :bigint
#  nomenclature_id :bigint
#
# Indexes
#
#  index_items_on_admin_id         (admin_id)
#  index_items_on_nomenclature_id  (nomenclature_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#  fk_rails_...  (nomenclature_id => nomenclatures.id)
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create :item }

  describe 'creation' do
    context 'price' do
      it { expect(item).to validate_presence_of(:price) }
      it { expect(item).to validate_numericality_of(:price).is_greater_than(0) }
    end

    context 'with quantity' do
      it { expect(item).to validate_presence_of(:quantity) }
      it { expect(item).to validate_numericality_of(:quantity).is_greater_than(0) }
    end
  end

  context 'is created' do
    context 'when item is created'
    it { expect(item).to be_valid }
  end

  describe 'associations' do
    context 'when belong to admin' do
      it { should belong_to(:admin) }
    end

    context 'when belong to nomenclature' do
      it { should belong_to(:nomenclature) }
    end
  end
end
