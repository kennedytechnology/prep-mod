class CreateClinicStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_staffs do |t|
      t.integer :clinic_id
      t.string :name

      t.timestamps
    end
  end
end
