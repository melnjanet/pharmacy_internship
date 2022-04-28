class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :cart, foreign_key: true, index: true
      t.references :order, foreign_key: true, index: true
      t.references :item, foreign_key: true, index: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
