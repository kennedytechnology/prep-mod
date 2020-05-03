require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  let(:clinic) { create(:clinic) }

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

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: clinic.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #acitivity" do
    it "returns http success" do
      get :activity, params: { clinic_id: clinic.id }
      expect(response).to have_http_status(:success)
    end
  end
end
