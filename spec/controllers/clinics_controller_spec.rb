require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  before { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
