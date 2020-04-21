class ChangeConsentDateToDateInPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :consent_date
    add_column :patients, :consent_date, :date
  end
end
