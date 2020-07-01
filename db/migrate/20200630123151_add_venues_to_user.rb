class AddVenuesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :venues, :string, array: true, default: []
  end
end
