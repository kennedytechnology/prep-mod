class NewsSignup < ApplicationRecord
  serialize :topics, Array

  validates_presence_of :email, :first_name, :last_name, :date_of_birth, :zip_code, :occupation,
                        :chronic_health_condition
end
