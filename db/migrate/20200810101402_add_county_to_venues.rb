class AddCountyToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :county, :string
  end
end
