class ChangePopulationServedName < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :population_served, :freezer
  end
end
