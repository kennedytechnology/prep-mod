class AddCountyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :county, :string
  end
end
