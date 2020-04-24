class DetailsForClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :contact_type, :string
    add_column :clinic_events, :screening_outcome, :string
    

    add_column :clinic_events, :test_name, :string
    add_column :clinic_events, :test_type, :string
    add_column :clinic_events, :test_processing, :string
  end
end
