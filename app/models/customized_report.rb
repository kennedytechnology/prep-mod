class CustomizedReport < ApplicationRecord
  belongs_to :user
  belongs_to :clinic, optional: true
end
