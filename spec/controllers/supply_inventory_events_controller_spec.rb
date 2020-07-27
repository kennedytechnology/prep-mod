require 'rails_helper'

RSpec.describe SupplyInventoryEventsController, type: :controller do
  let(:user) { create(:user) }
  let(:supply_inventory) { create(:supply_inventory, user: user) }
  let(:supply_inventory_event) { create(:supply_inventory_event, supply_inventory: supply_inventory) }
  let(:valid_attributes) { attributes_for(:supply_inventory_event).merge({supply_inventory_id: supply_inventory.id}) }
  before { sign_in user }

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: supply_inventory_event.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new supply inventory" do
        expect {
          post :create, params: { supply_inventory_event: valid_attributes}
        }.to change(SupplyInventoryEvent, :count).by(1)
      end
    end
  end

  describe "POST #update" do
    context "success" do
      before do
        put :update, params: { id: supply_inventory_event.id, supply_inventory_event: { quantity_loaned: 20 } }
        supply_inventory_event.reload
      end

      it { expect(response).to redirect_to supply_inventory_path(supply_inventory_event.supply_inventory) }
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
    should permit(:quantity_used, :quantity_loaned, :quantity_destroyed,
        :quantity_lost, :event_date, :event_type, 
        :supply_inventory_id).
      for(:create, params: {supply_inventory_event: valid_attributes}).
      on(:supply_inventory_event)
  end
end
