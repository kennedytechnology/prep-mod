class Provider < ApplicationRecord
  belongs_to :user, optional: true
end
