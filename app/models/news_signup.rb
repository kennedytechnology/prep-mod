class NewsSignup < ApplicationRecord
  serialize :topics, Array
  validates :email, presence: true
end
