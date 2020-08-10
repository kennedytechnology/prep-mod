class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.date :clinic_date
      t.string :lead_vaccinator_name
      t.integer :students_registered
      t.string :clinic_status
      t.integer :user_id
      t.text :outcome_comments
      t.text :incidents_comments
      t.string :start_time
      t.string :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
