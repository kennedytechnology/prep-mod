class CreateJoinTableClinicAgeGroupProviderEnrollment < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinic_age_groups, :provider_enrollments do |t|
      # t.index [:clinic_age_group_id, :provider_enrollment_id]
      # t.index [:provider_enrollment_id, :clinic_age_group_id]
    end
  end
end
