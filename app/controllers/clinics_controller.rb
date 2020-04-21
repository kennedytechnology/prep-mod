class ClinicsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"
  def new
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
  end

  def create
    @clinic = Clinic.new(clinic_params)
  end

  def index
    @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
  end

  private

  def clinic_params
    params.require(:clinic).permit(
      clinic_personnel_attributes: [:name, :_destroy]
    )
  end
end
