class AddEventDateToClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :event_date, :date
  end
end
