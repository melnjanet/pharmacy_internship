# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  comment      :text
#  quantity     :integer          default(1), not null
#  state        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_item_id :bigint
#  recipe_id    :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_orders_on_line_item_id  (line_item_id)
#  index_orders_on_recipe_id     (recipe_id)
#  index_orders_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order do
    user

    quantity { Faker::Number.number(digits: 3) }
    created_at { DateTime.now }
  end
end
