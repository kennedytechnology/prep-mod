 require 'rails_helper'

RSpec.describe "/supply_inventories", type: :request do
  let(:user) { create(:user) }
  let(:supply_inventory) { create(:supply_inventory, user: user) }
  before { sign_in user }

  describe "GET /index" do
    it "renders a successful response" do
      get supply_inventories_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get supply_inventory_url(supply_inventory)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SupplyInventory" do
        expect {
          post supply_inventories_url, params: { supply_inventory: attributes_for(:supply_inventory)}
        }.to change(SupplyInventory, :count).by(1)
      end

      it "redirects to the created supply_inventory" do
        post supply_inventories_url, params: { supply_inventory: attributes_for(:supply_inventory) }
        expect(response).to redirect_to(supply_inventories_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new SupplyInventory" do
        expect {
          post supply_inventories_url, params: { supply_inventory: attributes_for(:invalid_supply_inventory) }
        }.to change(SupplyInventory, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post supply_inventories_url, params: { supply_inventory: attributes_for(:invalid_supply_inventory) }
        expect(response).to redirect_to(supply_inventories_url)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested supply_inventory" do
        patch supply_inventory_url(supply_inventory), params: { supply_inventory: attributes_for(:supply_inventory, product_name: "Updated Product Name") }
        supply_inventory.reload
        expect(supply_inventory.product_name).to eq("Updated Product Name")
      end

      it "redirects to the supply_inventory" do
        patch supply_inventory_url(supply_inventory), params: { supply_inventory: attributes_for(:supply_inventory) }
        supply_inventory.reload
        expect(response).to redirect_to(supply_inventory_url(supply_inventory))
      end
    end
  end
end
