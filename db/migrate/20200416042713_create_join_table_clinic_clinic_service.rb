class CreateJoinTableClinicClinicService < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinics, :clinic_services do |t|
    end
  end
end
