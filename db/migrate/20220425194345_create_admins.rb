class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.boolean :active, null: false, default: true
      t.integer :role, null: false, default: 0

      t.timestamps
    end
  end
end
