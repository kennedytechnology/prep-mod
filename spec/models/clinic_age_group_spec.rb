require 'rails_helper'

RSpec.describe ClinicAgeGroup, type: :model do
  it { should have_and_belong_to_many :clinics }

  context "validations" do
    subject { create(:clinic_age_group) }
    it { should be_valid }
  end
end
