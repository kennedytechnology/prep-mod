class SupplyInventoriesController < InheritedResources::Base
  # before_action :authenticate_user!
  layout "clinic_management"

  def index
    @clinic = Clinic.find(params[:clinic_id])
    @supply_inventories = @clinic.supply_inventories
    @supply_inventory = SupplyInventory.new
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

  def edit
    @supply_inventory = SupplyInventory.find(params[:id])
  end

  def update
    @supply_inventory = SupplyInventory.find(params[:id])

    if @supply_inventory.update(supply_inventory_params)
      redirect_to supply_inventories_path(clinic_id: @supply_inventory.clinic), notice: "Successfully Updated Inventory Item"
    else
      redirect_back fallback_location: supply_inventories_path(clinic_id: @supply_inventory.clinic), alert: "Error!"
    end
  end

  private

    def supply_inventory_params
      params.require(:supply_inventory).permit(
        :received_at, :item_type, :item_name, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :quantity_used, :quantity_loaned,
        :quantity_lost, :packaging, :source, :product_name, 
        :event_type, :clinic_id
      )
    end

end
