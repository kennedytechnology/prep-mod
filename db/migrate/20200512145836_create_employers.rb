class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :position
      t.string  :company_name
      t.text    :company_name_search
      t.string  :address_1
      t.string  :address_2
      t.string  :city
      t.string  :state
      t.string  :zip_code
      t.string  :office_phone
      t.string  :mobile_phone
      t.string  :email
      t.string  :total_employees
      t.string  :total_locations
      t.string  :business_locations
      t.boolean  :screening_info
      t.boolean  :testing_info
      t.boolean  :vacination_info
      t.boolean  :other_info

      t.timestamps
    end
  end
end
