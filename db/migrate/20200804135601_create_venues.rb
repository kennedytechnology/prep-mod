class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :address
      t.string :city
      t.integer :zip_code
      t.string :state
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
