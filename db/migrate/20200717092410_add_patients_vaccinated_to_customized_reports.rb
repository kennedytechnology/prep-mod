class AddPatientsVaccinatedToCustomizedReports < ActiveRecord::Migration[6.0]
  def change
    add_column :customized_reports, :patients_vaccinated, :boolean
    add_column :customized_reports, :test_type, :boolean
    add_column :customized_reports, :test_result, :boolean
    add_column :customized_reports, :remarks, :boolean
  end
end
