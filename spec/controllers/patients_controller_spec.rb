require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:patient) { create(:patient) }
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
      get :edit, params: { id: patient.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: patient.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns https success" do
      delete :destroy, params: {id: patient.id}
      expect(response).to have_http_status(:redirect)
    end
  end
end
