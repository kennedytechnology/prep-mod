class AddUserIdToClinicEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_events, :user_id, :integer
  end
end
