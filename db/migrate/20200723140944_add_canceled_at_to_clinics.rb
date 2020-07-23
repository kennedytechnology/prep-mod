class AddCanceledAtToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :canceled_at, :datetime
  end
end
