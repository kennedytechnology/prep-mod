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

  context "should return full name" do
    subject { create(:patient) }
    it { expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}") }
  end

  context "should return address name" do
    subject { create(:patient) }
    it { expect(subject.full_address).to eq("#{subject.address}, #{subject.city}, #{subject.state} #{subject.zip_code}") }
  end
end
