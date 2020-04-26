class SupplyInventoriesController < InheritedResources::Base
  before_action :authenticate_user!
  layout "clinic_management"

  def index
    @clinic = Clinic.find(params[:clinic_id])
    @supply_inventories = @clinic.supply_inventories
  end

  def new
    @supply_inventory = SupplyInventory.new
  end

  def create
    @supply_inventory = SupplyInventory.new(supply_inventory_params)

    if @supply_inventory.save
      redirect_to supply_inventories_path(clinic_id: @supply_inventory.clinic), notice: "Successfully Added Inventory Item"
    else
      redirect_back fallback_location: supply_inventories_path(clinic_id: @supply_inventory.clinic), alert: "Error!"
    end
  end

  private

    def supply_inventory_params
      params.require(:supply_inventory).permit(
        :received_at, :item_type, :item_name, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :packaging, :source, :product_name, 
        :event_type, :clinic_id
      )
    end

end
