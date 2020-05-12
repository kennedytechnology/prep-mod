class AddMiddleInitialToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :middle_initial, :string
  end
end
