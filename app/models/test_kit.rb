class TestKit < ApplicationRecord
  belongs_to :clinic
  validates :test_kits_quantity, numericality: {greater_than: 0}
end
