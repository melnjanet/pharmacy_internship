class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|
      t.references :nomenclature, foreign_key: true
      t.references :pharmacist, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.string :measure
      t.float :price, null: false, default: 0.0
      t.float :amount, nul: false, default: 0.0
      t.integer :reservation_quantity, null: false, default: 0

      t.timestamps
    end
  end
end
