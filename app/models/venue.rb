class Venue < ApplicationRecord
  belongs_to :named_place
  has_many :clinics
  
  def place_name
    named_place.name
  end
end
