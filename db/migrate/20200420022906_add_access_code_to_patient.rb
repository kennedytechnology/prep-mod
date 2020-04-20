class AddAccessCodeToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :access_code, :string
  end
end
