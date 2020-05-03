require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_and_belong_to_many :clinics }

  context "validations" do
    subject { create(:user) }
    it { should be_valid }
  end
end
