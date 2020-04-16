class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.integer :named_place_id
      t.string :name
      t.string :venue_category

      t.timestamps
    end
  end
end
