class AddBackUpPersonFieldsToEmployers < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :backup_first_name, :string
    add_column :employers, :backup_last_name, :string
    add_column :employers, :backup_position, :string
    add_column :employers, :backup_company_name, :string
    add_column :employers, :backup_address_1, :string
    add_column :employers, :backup_address_2, :string
    add_column :employers, :backup_city, :string
    add_column :employers, :backup_state, :string
    add_column :employers, :backup_zip_code, :string
    add_column :employers, :backup_office_phone, :string
    add_column :employers, :backup_mobile_phone, :string
    add_column :employers, :backup_email, :string
  end
end
