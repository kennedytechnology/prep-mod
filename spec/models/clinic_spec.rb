require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe 'associations' do
    it {should belong_to(:venue)}
  end
  

end
