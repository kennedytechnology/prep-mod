class AddChildFieldsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :has_child_allergies, :string
    add_column :patients, :has_child_serious_reaction_to_vaccine, :string
    add_column :patients, :has_child_immune_system_problem, :string
    add_column :patients, :is_child_pregnant_or_possible_to_become, :string
    add_column :patients, :has_child_been_vaccinated_last_four_weeks, :string
  end
end
