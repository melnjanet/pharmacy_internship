class AddColumnsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :admin, index: true
    add_reference :recipes, :order, index: true
    add_reference :recipes, :item, index: true
    rename_column :recipes, :age, :age_group
  end
end
