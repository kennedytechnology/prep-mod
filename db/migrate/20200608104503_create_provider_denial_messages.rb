class CreateProviderDenialMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_denial_messages do |t|
      t.text :body

      t.timestamps
    end
  end
end
