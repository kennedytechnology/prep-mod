require 'rails_helper'

RSpec.describe StatesHelper, type: :helper do
  describe "should list all us states" do
    let(:user) { create(:user) }
    before { sign_in user}

    it "checks if states include Alabama" do
      expect(us_states).to include ['Alabama', 'AL']
    end
  end
end
