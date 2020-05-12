class CreateJoinTableEmployerPatient < ActiveRecord::Migration[6.0]
  def change
    create_join_table :employers, :patients do |t|
      # t.index [:employer_id, :patient_id]
      # t.index [:patient_id, :employer_id]
    end
  end
end
