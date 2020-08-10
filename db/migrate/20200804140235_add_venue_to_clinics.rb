class AddVenueToClinics < ActiveRecord::Migration[6.0]
  def change
    add_reference :clinics, :venue, foreign_key: true
  end
end
