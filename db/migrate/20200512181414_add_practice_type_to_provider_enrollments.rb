class AddPracticeTypeToProviderEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_enrollments, :practice_type, :string
  end
end
