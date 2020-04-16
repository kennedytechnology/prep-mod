class CreateInsuranceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :insurance_types do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
  end
end
