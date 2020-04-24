class SafetyKitForClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :safety_kit_received, :boolean
  end
end
