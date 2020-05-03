require 'rails_helper'

RSpec.describe Patient, type: :model do
  # TODO: Check why insurance_types table doesn't have patient_id
  # it { should have_many :insurance_types }
  it { should have_many :clinic_events }
  it { should have_many(:clinics).through(:clinic_events) }
  it { should belong_to(:clinic).optional }

  context "validations" do
    subject { create(:patient) }

    it { should be_valid }
  end
end
