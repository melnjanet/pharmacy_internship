class DropPharmacists < ActiveRecord::Migration[6.1]
  def change
    drop_table :pharmacists
  end
end
