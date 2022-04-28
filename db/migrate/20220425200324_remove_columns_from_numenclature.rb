class RemoveColumnsFromNumenclature < ActiveRecord::Migration[6.1]
  def change
    remove_column :nomenclatures, :manufacturer
    remove_column :nomenclatures, :generic_name
  end
end
