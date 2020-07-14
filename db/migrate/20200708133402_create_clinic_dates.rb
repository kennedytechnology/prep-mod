class CreateClinicDates < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_dates do |t|
      t.references :clinic, null: false, foreign_key: true
      t.date :date_of_clinic

      t.timestamps
    end
  end
end
