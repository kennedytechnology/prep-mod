class CreateJoinTableVaccineOfferingsPatients < ActiveRecord::Migration[6.0]
  def change
    create_join_table :vaccine_offerings, :patients do |t|
      # t.index [:vaccine_offering_id, :patient_id]
      # t.index [:patient_id, :vaccine_offering_id]
    end
  end
end
