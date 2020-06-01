class ResultShareAuthorization < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :sharing_results_authorized, :boolean
  end
end
