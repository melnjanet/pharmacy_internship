# == Schema Information
#
# Table name: nomenclatures
#
#  id              :bigint           not null, primary key
#  age_group       :integer          default("adult")
#  brand_name      :string
#  description     :text
#  dosage_form     :integer          default("tablet")
#  package_size    :integer
#  package_units   :integer          default("tbl"), not null
#  prescription    :boolean          default(FALSE), not null
#  strength        :integer
#  strength_units  :integer          default("mg"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  atc_code_id     :bigint
#  country_id      :bigint
#  generic_name_id :bigint
#  manufacture_id  :bigint
#
# Indexes
#
#  index_nomenclatures_on_atc_code_id      (atc_code_id)
#  index_nomenclatures_on_country_id       (country_id)
#  index_nomenclatures_on_generic_name_id  (generic_name_id)
#  index_nomenclatures_on_manufacture_id   (manufacture_id)
#
require 'rails_helper'

RSpec.describe Nomenclature, type: :model do
  let(:nomenclature) { FactoryBot.create :nomenclature }

  describe 'creation' do
    context 'with brand_name' do
      it { expect(nomenclature).to validate_presence_of(:brand_name) }
      it { expect(nomenclature).to validate_uniqueness_of(:brand_name) }
      it { expect(nomenclature).to validate_length_of(:brand_name).is_at_least(3) }
    end

    context 'with package_size' do
      it { expect(nomenclature).to validate_presence_of(:package_size) }
    end

    context 'with age_group' do
      it { should define_enum_for(:age_group) }
    end

    context 'with package_units' do
      it { should define_enum_for(:package_units) }
    end

    context 'with strength_units' do
      it { should define_enum_for(:strength_units) }
    end

    context 'with dosage_form' do
      it { should define_enum_for(:dosage_form) }
    end

    context 'with prescription' do
      it { expect(nomenclature).to validate_presence_of(:prescription) }
    end
  end

  context 'is created' do
    context 'when nomenclature is created'
    it { expect(nomenclature).to be_valid }
  end

  describe 'associations' do
    context 'when belong to atc_code' do
      it { should belong_to(:atc_code) }
    end

    context 'when belong to country' do
      it { should belong_to(:country) }
    end

    context 'when belong to manufacture' do
      it { should belong_to(:manufacture) }
    end

    context 'when belong to generic_name' do
      it { should belong_to(:generic_name) }
    end
  end
end
