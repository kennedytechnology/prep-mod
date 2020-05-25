class AddUniqueNumberToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :unique_number, :string
  end
end
