require 'rails_helper'

RSpec.describe ClinicEvent, type: :model do
  it { should belong_to(:clinic).optional }
  it { should belong_to :patient }
  it { should belong_to(:user).optional }

  context "validations" do
    subject { build(:clinic_event) }

    it { should be_valid }
  end
end
