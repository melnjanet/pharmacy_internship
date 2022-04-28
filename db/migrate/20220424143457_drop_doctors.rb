class DropDoctors < ActiveRecord::Migration[6.1]
  def change
    drop_table :doctors
  end
end
