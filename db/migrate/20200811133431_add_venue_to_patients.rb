class AddVenueToPatients < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :venue, foreign_key: true
  end
end
