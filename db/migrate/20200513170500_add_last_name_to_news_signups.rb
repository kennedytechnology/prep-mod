class AddLastNameToNewsSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :news_signups, :last_name, :string
  end
end
