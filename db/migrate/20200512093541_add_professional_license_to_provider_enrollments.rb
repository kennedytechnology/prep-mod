class AddProfessionalLicenseToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :professional_license, :string
  end
end
