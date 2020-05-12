class AddTwoFieldsToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :license_state_of_issue, :string
    add_column :provider_enrollments, :license_date_of_issue, :date
  end
end
