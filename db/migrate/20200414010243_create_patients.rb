class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :clinic_id
      t.integer :student_id
      t.string :vaccination_status
      t.integer :clinic_vaccine_id
      t.integer :user_id
      t.integer :clinic_staff_id
      t.string :reaction_type
      t.integer :downloaded_status

      t.timestamps
    end
  end
end
