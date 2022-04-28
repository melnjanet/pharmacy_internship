class RemoveFieldsFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :doctor_id
    remove_column :recipes, :supply_id
    remove_column :recipes, :comments
  end
end
