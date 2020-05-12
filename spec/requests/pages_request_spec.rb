require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /landing_page" do
    before { sign_in create(:user) }

    it "returns http success" do
      get "/pages/landing_page"
      expect(response).to have_http_status(:success)
    end
  end

end