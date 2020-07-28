class SupplyInventoriesImportsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def new
    @supply_inventories_import = SupplyInventoriesImport.new
  end

  def create
    if params[:supply_inventories_import]
      @supply_inventories_import = SupplyInventoriesImport.new(supply_inventories_import_params)
      if @supply_inventories_import.save
        redirect_to supply_inventories_path, notice: "Successfully uploaded records."
      else
        render :new
      end
    else
      @supply_inventories_import = SupplyInventoriesImport.new
      # byebug
      # @errors = []
      # @errors << "File can't be empty!"
      @supply_inventories_import.errors.add(:base, "File can't be empty!")
      render :new
    end
  end

  private

  def supply_inventories_import_params
    params.require(:supply_inventories_import).permit(:file)
  end
end