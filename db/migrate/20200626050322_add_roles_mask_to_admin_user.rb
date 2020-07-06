class AddRolesMaskToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :roles_mask, :int
  end
end
