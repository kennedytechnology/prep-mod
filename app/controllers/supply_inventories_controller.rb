class SupplyInventoriesController < InheritedResources::Base
  before_action :authenticate_user!
  layout "clinic_management"

  def index
    @supply_inventories = SupplyInventory.all
    @supply_inventory = SupplyInventory.new
  end

  def create
    @supply_inventory = SupplyInventory.new(supply_inventory_params)

    if @supply_inventory.save
      redirect_to supply_inventories_path, notice: "Successfully Added Inventory Item"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error!"
    end
  end

  def show
    @supply_inventory = SupplyInventory.find(params[:id])
  end

  def edit
    @supply_inventory = SupplyInventory.find(params[:id])
  end

  def update
    @supply_inventory = SupplyInventory.find(params[:id])

    if @supply_inventory.update(supply_inventory_params)
      redirect_to supply_inventories_path, notice: "Successfully Updated Inventory Item"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error!"
    end
  end

  def destroy
    SupplyInventory.destroy(params[:id])
    redirect_back fallback_location: supply_inventories_path, alert: "The inventory was deleted."
  end

  private

    def supply_inventory_params
      params.require(:supply_inventory).permit(
        :received_at, :item_type, :item_name, 
        :manufacturer, :lot_number, :expiration_date,
        :quantity, :quantity_used, :quantity_loaned,
        :quantity_lost, :packaging, :source, :product_name, 
        :event_date, :event_type, :county, :venue_name
      )
    end

end
