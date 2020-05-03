require 'rails_helper'

RSpec.describe SupplyInventoriesController, type: :controller do
  let(:supply_inventory) { create(:supply_inventory) }
  before { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { clinic_id: supply_inventory.clinic.id }
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
      get :edit, params: { id: supply_inventory.id }
      expect(response).to have_http_status(:success)
    end
  end
end
