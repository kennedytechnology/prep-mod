require 'rails_helper'

RSpec.describe ClinicEventsController, type: :controller do
  let(:clinic_event) { create(:clinic_event) }
  before { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
