class AddProviderIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider_id, :integer
  end
end
