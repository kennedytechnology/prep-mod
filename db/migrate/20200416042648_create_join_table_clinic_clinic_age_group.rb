class CreateJoinTableClinicClinicAgeGroup < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinics, :clinic_age_groups do |t|
    end
  end
end
