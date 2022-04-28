# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  age_group  :integer          default("adult"), not null
#  expiry     :date
#  number     :string
#  quantity   :integer          default(1), not null
#  used       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#  item_id    :bigint
#  order_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_recipes_on_admin_id  (admin_id)
#  index_recipes_on_item_id   (item_id)
#  index_recipes_on_order_id  (order_id)
#  index_recipes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { FactoryBot.create :recipe }

  describe 'creation' do
    context 'with number' do
      it { expect(recipe).to validate_presence_of(:number) }
      it { expect(recipe).to validate_uniqueness_of(:number) }
    end

    context 'with age_group' do
      it { should define_enum_for(:age_group) }
    end

    context 'with quantity' do
      it { expect(recipe).to validate_presence_of(:quantity) }
      it { expect(recipe).to validate_numericality_of(:quantity).is_greater_than(0) }
    end

    context 'with used' do
      it { expect(recipe).to validate_presence_of(:used) }
    end

    context 'with expiry' do
      it { expect(recipe).to validate_presence_of(:expiry) }
    end
  end

  context 'is created' do
    context 'when recipe is created'
    it { expect(recipe).to be_valid }
  end

  describe 'associations' do
    context 'when belong to orders' do
      it { should belong_to(:admin) }
    end

    context 'when belong to item' do
      it { should belong_to(:user) }
    end
  end
end
