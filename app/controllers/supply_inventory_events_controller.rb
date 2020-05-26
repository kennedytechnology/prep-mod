class SupplyInventoryEventsController < InheritedResources::Base
  before_action :authenticate_user!
  layout "clinic_management"

  def create
    @supply_inventory_event = SupplyInventoryEvent.new(supply_inventory_event_params)

    if @supply_inventory_event.save
      redirect_back fallback_location: supply_inventories_path, notice: "Successfully added Event"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error!"
    end
  end

  def edit
    @supply_inventory_event = SupplyInventoryEvent.find(params[:id])
  end

  def update
    @supply_inventory_event = SupplyInventoryEvent.find(params[:id])

    if @supply_inventory_event.update(supply_inventory_event_params)
      redirect_to supply_inventory_path(@supply_inventory_event.supply_inventory), notice: "Successfully updated Event"
    else
      redirect_back fallback_location: supply_inventories_path, alert: "Error!"
    end
  end

  def destroy
    SupplyInventoryEvent.destroy(params[:id])
    redirect_back fallback_location: supply_inventories_path, alert: "The event was deleted."
  end

  private

    def supply_inventory_event_params
      params.require(:supply_inventory_event).permit(
        :quantity_used, :quantity_loaned, :quantity_destroyed,
        :quantity_lost, :event_date, :event_type, 
        :supply_inventory_id)
    end

end
