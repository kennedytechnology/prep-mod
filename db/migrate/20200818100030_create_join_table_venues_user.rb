class CreateJoinTableVenuesUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :venues, :users do |t|
      t.index [:venue_id, :user_id]
      t.index [:user_id, :venue_id]
    end
  end
end
