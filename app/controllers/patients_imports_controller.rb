class PatientsImportsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def new
    @patients_import = PatientsImport.new
  end

  def create
    if params[:patients_import]
      @patients_import = PatientsImport.new(patients_import_params.merge(user_id: current_user.id))
      if @patients_import.save
        redirect_to patients_path, notice: "Successfully uploaded records."
      else
        render :new
      end
    else
      @patients_import = PatientsImport.new
      @patients_import.errors.add(:base, "File can't be empty!")
      render :new
    end
  end

  private

  def patients_import_params
    params.require(:patients_import).permit(:file)
  end
end