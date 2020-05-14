class CreateJoinTableClinicPrimaryGroupClinic < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinic_primary_groups, :clinics do |t|
      # t.index [:clinic_primary_group_id, :clinic_id]
      # t.index [:clinic_id, :clinic_primary_group_id]
    end
  end
end
