require 'rails_helper'

RSpec.describe ProviderEnrollment, type: :model do
  context "validations" do
    subject { create(:provider_enrollment) }
    it { should be_valid }
  end
end
