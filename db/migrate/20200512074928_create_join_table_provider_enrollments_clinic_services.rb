class CreateJoinTableProviderEnrollmentsClinicServices < ActiveRecord::Migration[6.0]
  def change
    create_join_table :provider_enrollments, :clinic_services do |t|
      # t.index [:provider_enrollment_id, :clinic_service_id]
      # t.index [:clinic_service_id, :provider_enrollment_id]
    end
  end
end
