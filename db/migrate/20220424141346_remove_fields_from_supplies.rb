class RemoveFieldsFromSupplies < ActiveRecord::Migration[6.1]
  def change
    remove_column :supplies, :pharmacist_id
    remove_column :supplies, :nomenclature_id
  end
end
