require 'rails_helper'

RSpec.describe SupplyInventoryEventsController, type: :controller do
  let(:supply_inventory_event) { create(:supply_inventory_event) }
  before { sign_in create(:user) }

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: supply_inventory_event.id }
      expect(response).to have_http_status(:success)
    end
  end

  # TODO: Check why the SupplyInventoryEvent is changed by 2
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "create new supply inventory" do
  #       expect {
  #         post :create, params: { supply_inventory_event: {
  #           supply_inventory_id: supply_inventory_event.supply_inventory_id,
  #           quantity_used: Faker::Number.between(from: 1, to: 5),
  #           quantity_lost: Faker::Number.between(from: 1, to: 3),
  #           quantity_loaned: Faker::Number.between(from: 1, to: 3),
  #           quantity_destroyed: Faker::Number.between(from: 1, to: 3),
  #           event_type: INVENTORY_EVENT_TYPES.sample,
  #           event_date: Faker::Date.between(from: Date.today, to: 30.days.from_now)
  #         } }
  #       }.to change(SupplyInventoryEvent, :count).by(1)
  #     end
  #   end
  # end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: supply_inventory_event.id, supply_inventory_event: { quantity_loaned: 20 } }
        supply_inventory_event.reload
      end

      it { expect(response).to redirect_to supply_inventory_path(supply_inventory_event.supply_inventory) }
      it { expect(flash[:notice]).to match("Successfully updated Event") }
      it { expect(supply_inventory_event.quantity_loaned).to eq(20) }
    end
  end

  describe "DELETE #destroy" do
    it "returns https success" do
      delete :destroy, params: {id: supply_inventory_event.id}
      expect(response).to have_http_status(:redirect)
    end
  end

  it do
    params = {
      supply_inventory_event: {
        quantity_used: Faker::Number.between(from: 1, to: 5),
        quantity_lost: Faker::Number.between(from: 1, to: 3),
        quantity_loaned: Faker::Number.between(from: 1, to: 3),
        quantity_destroyed: Faker::Number.between(from: 1, to: 3),
        event_type: INVENTORY_EVENT_TYPES.sample,
        event_date: Faker::Date.between(from: Date.today, to: 30.days.from_now)
      }
    }
    should permit(:quantity_used, :quantity_loaned, :quantity_destroyed,
        :quantity_lost, :event_date, :event_type, 
        :supply_inventory_id).
      for(:create, params: params).
      on(:supply_inventory_event)
  end
end
