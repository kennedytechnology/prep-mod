class AddOccupationToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :occupation, :string
  end
end
