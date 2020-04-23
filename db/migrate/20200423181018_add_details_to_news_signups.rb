class AddDetailsToNewsSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :news_signups, :zip_code, :string
    add_column :news_signups, :date_of_birth, :date
    add_column :news_signups, :topics, :string
  end
end
