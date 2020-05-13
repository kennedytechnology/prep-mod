class AddWebsiteToEmployers < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :website, :string
  end
end
