require 'rails_helper'

RSpec.describe ProviderEnrollmentsController, type: :controller do
  before { sign_in create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
