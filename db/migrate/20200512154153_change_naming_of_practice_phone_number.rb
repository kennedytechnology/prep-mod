class ChangeNamingOfPracticePhoneNumber < ActiveRecord::Migration[6.0]
  def change
    rename_column :provider_enrollments, :practice_phone_number, :practice_mobile_phone
  end
end
