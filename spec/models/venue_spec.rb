require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe 'associations' do
    it {should belong_to(:named_place)}
  end
end
