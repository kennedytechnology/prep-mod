class AddSchoolFieldsToClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :is_refused, :boolean
    add_column :clinic_events, :is_sick, :boolean
    add_column :clinic_events, :is_absent, :boolean
  end
end
