require 'rails_helper'

RSpec.describe ClinicPrimaryGroup, type: :model do
  it { should have_and_belong_to_many :provider_enrollments }

  context "validations" do
    subject { build(:clinic_age_group) }

    it { should be_valid }
  end
end
