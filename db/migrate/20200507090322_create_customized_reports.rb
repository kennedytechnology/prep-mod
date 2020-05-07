class CreateCustomizedReports < ActiveRecord::Migration[6.0]
  def change
    create_table :customized_reports do |t|

      t.timestamps
    end
  end
end
