class ChangeProviderEnrollmentColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :practice_zip, :practice_zip_code
  end
end
