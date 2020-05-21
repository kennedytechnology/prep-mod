require 'rails_helper'

RSpec.describe SupplyInventoriesController, type: :controller do
  let(:supply_inventory) { create(:supply_inventory) }
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
          post :create, params: { supply_inventory: {
            received_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
            item_type: INVENTORY_ITEM_TYPES.sample,
            item_name: Faker::Lorem.words(number: 2).collect(&:capitalize).join(" "),
            manufacturer: INVENTORY_MANUFACTURERS.sample,
            lot_number: Faker::Code.asin,
            expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now),
            quantity: Faker::Number.between(from: 10, to: 20),
            quantity_used: Faker::Number.between(from: 1, to: 5),
            quantity_lost: Faker::Number.between(from: 1, to: 3),
            quantity_loaned: Faker::Number.between(from: 1, to: 3),
            packaging: INVENTORY_PACKAGINGS.sample,
            source: INVENTORY_SOURCES.sample,
            product_name: Faker::Company.name,
            event_type: INVENTORY_EVENT_TYPES.sample
          } }
        }.to change(SupplyInventory, :count).by(1)
      end
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: supply_inventory.id, supply_inventory: { received_at: Date.today } }
        supply_inventory.reload
      end

      it { expect(response).to redirect_to supply_inventories_path }
      it { expect(supply_inventory.received_at).to eq(Date.today) }
    end
  end

  it do
    params = {
      supply_inventory: {
        received_at: Faker::Date.between(from: 30.days.ago, to:Date.today),
        item_type: INVENTORY_ITEM_TYPES.sample,
        item_name: Faker::Lorem.words(number: 2).collect(&:capitalize).join(" "),
        manufacturer: INVENTORY_MANUFACTURERS.sample,
        lot_number: Faker::Code.asin,
        expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now),
        quantity: Faker::Number.between(from: 10, to: 20),
        quantity_used: Faker::Number.between(from: 1, to: 5),
        quantity_lost: Faker::Number.between(from: 1, to: 3),
        quantity_loaned: Faker::Number.between(from: 1, to: 3),
        packaging: INVENTORY_PACKAGINGS.sample,
        source: INVENTORY_SOURCES.sample,
        product_name: Faker::Company.name,
        event_type: INVENTORY_EVENT_TYPES.sample
      }
    }
    should permit(:received_at, :item_type, :item_name, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :quantity_used, :quantity_loaned,
        :quantity_lost, :packaging, :source, :product_name, 
        :event_type).
      for(:create, params: params).
      on(:supply_inventory)
  end
end
