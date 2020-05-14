class AddContactRemainingFieldsToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :contact_office_phone, :string
    add_column :provider_enrollments, :contact_mobile_phone, :string
    add_column :provider_enrollments, :contact_email, :string
  end
end
