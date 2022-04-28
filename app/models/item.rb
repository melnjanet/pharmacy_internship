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
class Item < ApplicationRecord
  validates :quantity, :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :quantity, greater_than: 0

  belongs_to :admin
  belongs_to :nomenclature

  has_many :recipes
  has_many :line_items
end
