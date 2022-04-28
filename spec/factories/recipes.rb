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
FactoryBot.define do
  factory :recipe do
    user
    admin
    order
    item

    number { Faker::String }
    quantity { Faker::Number.between(from: 1, to: 1000) }
    age_group { :adult || :child }
    expiry { Faker::Date.forward(days: 31) }
    used { false || true }
    created_at { DateTime.now }
  end
end
