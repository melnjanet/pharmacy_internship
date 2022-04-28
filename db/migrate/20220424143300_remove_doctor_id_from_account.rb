class RemoveDoctorIdFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :doctor_id
  end
end
