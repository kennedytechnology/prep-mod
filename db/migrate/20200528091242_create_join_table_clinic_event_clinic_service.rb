class CreateJoinTableClinicEventClinicService < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinic_events, :clinic_services do |t|
      # t.index [:clinic_event_id, :clinic_service_id]
      # t.index [:clinic_service_id, :clinic_event_id]
    end
  end
end
