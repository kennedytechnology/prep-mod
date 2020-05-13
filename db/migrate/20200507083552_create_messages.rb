class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.boolean :send_to_all_users
      t.string :status

      t.timestamps
    end
  end
end
