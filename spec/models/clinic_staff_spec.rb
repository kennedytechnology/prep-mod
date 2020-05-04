require 'rails_helper'

RSpec.describe ClinicStaff, type: :model do
  it { should belong_to :clinic }

  context "validations" do
    subject { create(:clinic_staff) }
    it { should be_valid }
  end
end
