class AddDefaultToTestKits < ActiveRecord::Migration[6.0]
  def change
    add_column :test_kits, :is_default, :boolean
  end
end
