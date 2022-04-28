class AddColumnsToNomenclatures < ActiveRecord::Migration[6.1]
  def change
    add_reference :nomenclatures, :country, index: true
    add_reference :nomenclatures, :atc_code, index: true
    add_reference :nomenclatures, :manufacture, index: true
    add_reference :nomenclatures, :generic_name, index: true
    add_column :nomenclatures, :strength_units, :integer,null: false, default: 0
    add_column :nomenclatures, :package_size, :integer
    add_column :nomenclatures, :package_units, :integer, null: false, default: 0
    change_column_default :nomenclatures, :age, 1
    change_column_default :nomenclatures, :dosage_form, 0
    rename_column :nomenclatures, :age, :age_group
    change_column :nomenclatures, :strength, :integer, using: 'strength::integer'
  end
end
