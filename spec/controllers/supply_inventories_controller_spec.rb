require 'rails_helper'

RSpec.describe SupplyInventoriesController, type: :controller do
  let(:supply_inventory) { create(:supply_inventory) }
  let(:valid_attributes) { attributes_for(:supply_inventory) }
  before { sign_in create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new supply inventory" do
        expect {
          post :create, params: { supply_inventory: valid_attributes}
        }.to change(SupplyInventory, :count).by(1)
      end
    end
  end

  it do
    should permit(:received_at, :item_type, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :packaging, :source, :product_name,
        :county, :venue_name).
      for(:create, params: {supply_inventory: valid_attributes}).
      on(:supply_inventory)
  end
end
