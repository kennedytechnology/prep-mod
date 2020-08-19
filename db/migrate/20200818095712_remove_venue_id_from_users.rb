class RemoveVenueIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :venue_id, :bigint
  end
end
