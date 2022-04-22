class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :number
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :supply, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.integer :age, null: false, default: 1
      t.date :expiry
      t.text :comments
      t.boolean :used, null: false, default: false

      t.timestamps
    end
  end
end
