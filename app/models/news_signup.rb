class NewsSignup < ApplicationRecord
  serialize :topics, Array

  validates_presence_of :email, :first_name, :last_name, :date_of_birth, :zip_code, :occupation
  validates :chronic_health_condition, inclusion: { in: [ true, false ] }
  validate :topics_cannot_be_empty

  def topics_cannot_be_empty
    errors.add(:base, "You must select at least 1 topic.") if topics.any?{ |t| t == "0" }
  end
end
