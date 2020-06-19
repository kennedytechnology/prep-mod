class AddHasOtherReasonExplanationToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :has_other_reason_explanation, :text
  end
end
