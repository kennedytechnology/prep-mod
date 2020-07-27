class ItemsImportsController < ApplicationController
  def new
    @items_import = ItemsImport.new
  end

  def create
    @items_import = ItemsImport.new(params[:items_import])
    if @items_import.save
      redirect_back fallback_location: "/clinics", notice: "Successfully uploaded records."
    else
      render :new
    end
  end
end