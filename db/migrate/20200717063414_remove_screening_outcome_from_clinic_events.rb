class RemoveScreeningOutcomeFromClinicEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :clinic_events, :screening_outcome
  end
end
