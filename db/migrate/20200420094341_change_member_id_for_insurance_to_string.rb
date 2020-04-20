class ChangeMemberIdForInsuranceToString < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :member_id_for_insurance, :string
  end
end
