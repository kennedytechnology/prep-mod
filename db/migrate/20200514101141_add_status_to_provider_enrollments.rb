class AddStatusToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :status, :string
  end
end
