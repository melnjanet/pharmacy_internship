class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :doctor, foreign_key: true
      t.integer :number, limit: 8
      t.float :amount
      t.date :expiry

      t.timestamps
    end
  end
end
