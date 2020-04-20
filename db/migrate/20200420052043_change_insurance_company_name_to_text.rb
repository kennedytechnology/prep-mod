class ChangeInsuranceCompanyNameToText < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :insurance_company_name, :string
  end
end
