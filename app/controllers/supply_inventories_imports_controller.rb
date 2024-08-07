class SupplyInventoriesImportsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def new
    @supply_inventories_import = SupplyInventoriesImport.new

    respond_to do |format|
      format.html
      format.xlsx do
        render  template: 'supply_inventories_imports/headers_example',
                disposition: 'inline',
                xlsx: "headers_example_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
                filename: "headers_example_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
                xlsx_author: current_user.name
      end
    end
  end

  def create
    if params[:supply_inventories_import]
      @supply_inventories_import = SupplyInventoriesImport.new(supply_inventories_import_params.merge(user_id: current_user.id))
      if @supply_inventories_import.save
        redirect_to supply_inventories_path, notice: "Successfully uploaded records."
      else
        render :new
      end
    else
      @supply_inventories_import = SupplyInventoriesImport.new
      @supply_inventories_import.errors.add(:base, "File can't be empty!")
      render :new
    end
  end

  private

  def supply_inventories_import_params
    params.require(:supply_inventories_import).permit(:file)
  end
end