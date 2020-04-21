class ClinicsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"
  def new
    @clinic = Clinic.new
  end

  def create
  end

  def index
    @clinics = Clinic.all.paginate(page: params[:page], per_page: 5)
  end

  private

  def clinic_params
    params.require(:clinic).permit()
  end
end
