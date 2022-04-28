class CreateGenericNames < ActiveRecord::Migration[6.1]
  def change
    create_table :generic_names do |t|
      t.string :title

      t.timestamps
    end
  end
end
