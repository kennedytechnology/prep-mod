require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /landing_page" do
    let(:clinic) { create(:clinic) }
    before { sign_in create(:user) }

    it "returns http success" do
      get "/pages/landing_page", params: {clinic_id: clinic.id}
      expect(response).to have_http_status(:success)
    end
  end

end
