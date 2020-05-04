require 'rails_helper'

RSpec.describe ClinicService, type: :model do
  it { should have_and_belong_to_many :clinics }

  context "validations" do
    subject { create(:clinic_service) }
    it { should be_valid }
  end
end
