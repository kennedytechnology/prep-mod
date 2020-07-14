class DropClinicDates < ActiveRecord::Migration[6.0]
  def change
    drop_table :clinic_dates
  end
end
