class AddCategoryToClinicService < ActiveRecord::Migration[6.0]
  def change
    add_column :clinic_services, :category, :string
  end
end
