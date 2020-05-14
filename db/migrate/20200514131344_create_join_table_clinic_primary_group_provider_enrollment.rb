class CreateJoinTableClinicPrimaryGroupProviderEnrollment < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinic_primary_groups, :provider_enrollments do |t|
      # t.index [:clinic_primary_group_id, :provider_enrollment_id]
      # t.index [:provider_enrollment_id, :clinic_primary_group_id]
    end
  end
end
