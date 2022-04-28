class AddAdminIdToAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :admin, index: true
  end
end
