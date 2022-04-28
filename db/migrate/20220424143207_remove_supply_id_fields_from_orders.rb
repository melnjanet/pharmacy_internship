class RemoveSupplyIdFieldsFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :supply_id
  end
end
