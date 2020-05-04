require 'rails_helper'

RSpec.describe SupplyInventory, type: :model do
  it { should belong_to(:clinic) }

  context "validations" do
    subject { create(:supply_inventory) }
    it { should be_valid }
  end
end
