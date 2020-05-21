require 'rails_helper'

RSpec.describe Clinic, type: :model do
  it { should have_many :clinic_vaccines }
  it { should have_many(:clinic_personnel).class_name("ClinicStaff") }
  it { should have_many :clinic_events }
  it { should have_many :patients }
  it { should have_and_belong_to_many :users }
  it { should have_and_belong_to_many(:services).class_name("ClinicService") }
  it { should have_and_belong_to_many(:age_groups).class_name("ClinicAgeGroup") }
  it { should have_many :test_kits }

  it { should accept_nested_attributes_for :clinic_personnel }
  it { should accept_nested_attributes_for :clinic_events }
  it { should accept_nested_attributes_for :test_kits }

  context "validations" do
    subject { create(:clinic) }

    it { should be_valid }
  end

  context "should return clinic name" do
    subject { create(:clinic) }
    it { expect(subject.name).to eq("#{subject.venue_name} on #{subject.clinic_date}") }
  end
end
