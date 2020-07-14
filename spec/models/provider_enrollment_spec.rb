require 'rails_helper'

RSpec.describe ProviderEnrollment, type: :model do

  it { should have_and_belong_to_many :clinic_age_groups }
  it { should have_and_belong_to_many :clinic_primary_groups }
  it { should have_and_belong_to_many :clinic_services }

  context "validations" do
    subject { create(:provider_enrollment) }
    it { should be_valid }
  end
  
end
