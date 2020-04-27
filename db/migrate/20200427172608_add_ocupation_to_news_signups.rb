class AddOcupationToNewsSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :news_signups, :occupation, :string
  end
end
