require 'rails_helper'

RSpec.describe TestKit, type: :model do
  it { should belong_to :clinic }

  context "validations" do
    subject { create(:test_kit) }
    it { should be_valid }
  end
end
