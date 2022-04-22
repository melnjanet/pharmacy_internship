class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.references :supply, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
