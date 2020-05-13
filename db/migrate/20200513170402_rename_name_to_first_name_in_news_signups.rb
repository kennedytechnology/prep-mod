class RenameNameToFirstNameInNewsSignups < ActiveRecord::Migration[6.0]
  def change
    rename_column :news_signups, :name, :first_name
  end
end
