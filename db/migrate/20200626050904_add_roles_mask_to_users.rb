class AddRolesMaskToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles_mask, :int
  end
end
