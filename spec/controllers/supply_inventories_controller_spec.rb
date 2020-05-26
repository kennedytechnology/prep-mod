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
            packaging: INVENTORY_PACKAGINGS.sample,
            source: INVENTORY_SOURCES.sample,
            product_name: Faker::Company.name,
          } }
        }.to change(SupplyInventory, :count).by(1)
      end
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
        packaging: INVENTORY_PACKAGINGS.sample,
        source: INVENTORY_SOURCES.sample,
        product_name: Faker::Company.name
      }
    }
    should permit(:received_at, :item_type, :item_name, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :packaging, :source, :product_name).
      for(:create, params: params).
      on(:supply_inventory)
  end
end
