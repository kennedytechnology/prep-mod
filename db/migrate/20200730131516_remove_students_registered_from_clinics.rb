class RemoveStudentsRegisteredFromClinics < ActiveRecord::Migration[6.0]
  def change
    remove_column :clinics, :students_registered  
  end
end
