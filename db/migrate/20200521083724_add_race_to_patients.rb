class AddRaceToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :race, :string
  end
end
