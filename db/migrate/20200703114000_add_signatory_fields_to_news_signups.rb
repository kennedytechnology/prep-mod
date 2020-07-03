class AddSignatoryFieldsToNewsSignups < ActiveRecord::Migration[6.0]
  def change
    add_column :news_signups, :signatory_first_name, :string
    add_column :news_signups, :signatory_last_name, :string
  end
end
