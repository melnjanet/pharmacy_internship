class CreateAtcCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :atc_codes do |t|
      t.string  :code
      t.string :title

      t.timestamps
    end
  end
end
