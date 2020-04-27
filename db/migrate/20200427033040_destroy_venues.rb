class DestroyVenues < ActiveRecord::Migration[6.0]
  def change
    drop_table :venues
  end
end
