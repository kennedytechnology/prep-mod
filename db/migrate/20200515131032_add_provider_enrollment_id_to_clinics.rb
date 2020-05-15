class AddProviderEnrollmentIdToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :provider_enrollment_id, :integer
  end
end
