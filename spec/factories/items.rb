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
FactoryBot.define do
  factory :item do
    admin
    nomenclature

    price { Faker::Number.between(from: 0.01, to: 100000) }
    quantity { Faker::Number.between(from: 1, to: 1000) }
    created_at { DateTime.now }
  end
end
