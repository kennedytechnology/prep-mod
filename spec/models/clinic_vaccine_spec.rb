require 'rails_helper'

RSpec.describe ClinicVaccine, type: :model do
  it { should belong_to :clinic }

  context "validations" do
    subject { create(:clinic_vaccine) }
    it { should be_valid }
  end
end
