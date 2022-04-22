class CreateNomenclatures < ActiveRecord::Migration[6.1]
  def change
    create_table :nomenclatures do |t|
      t.string :generic_name
      t.string :brand_name
      t.string :manufacturer
      t.integer :dosage_form
      t.string :strength
      t.integer :age
      t.boolean :prescription, null: false, default: false
      t.text :description

      t.timestamps
    end
  end
end
