class CreateJoinTableClinicsUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clinics, :users do |t|
      # t.index [:clinic_id, :user_id]
      # t.index [:user_id, :clinic_id]
    end
  end
end
