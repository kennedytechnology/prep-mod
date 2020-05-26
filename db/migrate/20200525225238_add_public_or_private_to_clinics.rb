class AddPublicOrPrivateToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :public_or_private, :string
  end
end
