class AddChronicHealthConditionToNewsSignup < ActiveRecord::Migration[6.0]
  def change
    add_column :news_signups, :chronic_health_condition, :boolean
  end
end
