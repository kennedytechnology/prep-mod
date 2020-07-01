class AddSocialDistancingToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :social_distancing, :integer
  end
end
