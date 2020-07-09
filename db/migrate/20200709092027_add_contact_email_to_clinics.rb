class AddContactEmailToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :contact_email, :string
  end
end
