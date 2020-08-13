class SupplyInventoriesController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource
  layout "clinic_management"

  def index
    @supply_inventories = SupplyInventory.all.order(:received_at)
    @supply_inventory = SupplyInventory.new
  end

  def create
    @supply_inventory = SupplyInventory.new(supply_inventory_params)
    @supply_inventory.user = current_user

    if @supply_inventory.save
      redirect_to supply_inventories_path, notice: "Successfully Added Inventory"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error! #{@supply_inventory.errors.full_messages.join(", ")}"
    end
  end

  def update
    @supply_inventory = SupplyInventory.find(params[:id])

    if @supply_inventory.update_attributes(supply_inventory_params)
      redirect_to supply_inventories_path
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
        :county, :venue_name, :information_sheet
      )
    end

end
