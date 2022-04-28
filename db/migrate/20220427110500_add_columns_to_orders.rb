class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :line_item, index: true
    add_column :orders, :comment, :text
    add_column :orders, :state, :integer
  end
end
