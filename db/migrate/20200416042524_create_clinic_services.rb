class CreateClinicServices < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_services do |t|
      t.string :name

      t.timestamps
    end
  end
end
