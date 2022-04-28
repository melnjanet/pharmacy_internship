class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :nomenclature, foreign_key: true
      t.references :admin, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
