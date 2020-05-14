class AddCountyToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :county, :string
  end
end
