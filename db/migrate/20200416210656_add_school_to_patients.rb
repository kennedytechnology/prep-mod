class AddSchoolToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :school, :string
  end
end
