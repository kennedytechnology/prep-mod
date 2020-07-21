class TestKit < ApplicationRecord
  belongs_to :clinic
  attribute :unusable_tests, :integer, default: 0
  attribute :tests_returned, :integer, default: 0
  attribute :tests_administered, :integer, default: 0
  validates :test_kits_quantity, numericality: {greater_than: 0}
end
