class ChangeMedialSpecialtyName < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :medial_specialty, :medical_specialty
  end
end
