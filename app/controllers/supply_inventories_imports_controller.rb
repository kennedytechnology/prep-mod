class SupplyInventoriesImportsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def new
    @supply_inventories_import = SupplyInventoriesImport.new
  end

  def create
    @supply_inventories_import = SupplyInventoriesImport.new(supply_inventories_import_params)
    if @supply_inventories_import.save
      redirect_to supply_inventories_path, notice: "Successfully uploaded records."
    else
      render :new
    end
  end

  private

  def supply_inventories_import_params
    params.require(:supply_inventories_import).permit(:file)
  end
end