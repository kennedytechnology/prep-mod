class SupplyInventoriesController < InheritedResources::Base
  before_action :authenticate_user!
  layout "clinic_management"
  load_and_authorize_resource

  def index
    @supply_inventories = SupplyInventory.all
    @supply_inventory = SupplyInventory.new
  end

  def create
    @supply_inventory = SupplyInventory.new(supply_inventory_params)

    if @supply_inventory.save
      redirect_to supply_inventories_path, notice: "Successfully Added Inventory"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error! #{@supply_inventory.errors.full_messages.join(", ")}"
    end
  end

  def show
    @supply_inventory = SupplyInventory.find(params[:id])
    @supply_inventory_event = SupplyInventoryEvent.new
  end

  private

    def supply_inventory_params
      params.require(:supply_inventory).permit(
        :received_at, :item_type,
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :packaging, :source, :product_name,
        :county, :venue_name
      )
    end

end
