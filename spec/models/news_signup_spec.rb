require 'rails_helper'

RSpec.describe NewsSignup, type: :model do
  context "validations" do
    subject { create(:news_signup) }
    it { should be_valid }
  end
end
