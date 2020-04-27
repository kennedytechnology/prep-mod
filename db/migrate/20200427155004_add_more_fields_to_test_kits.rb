class AddMoreFieldsToTestKits < ActiveRecord::Migration[6.0]
  def change
    add_column :test_kits, :tests_administered, :integer
    add_column :test_kits, :unusable_tests, :integer
    add_column :test_kits, :tests_returned, :integer
  end
end
