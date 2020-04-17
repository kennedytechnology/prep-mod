class ClinicsController < ApplicationController
  def new
    @clinic = Clinic.new
  end

  def create
  end

  def index
    @clinics = Clinic.all
  end

  private

  def clinic_params
    params.require(:clinic).permit()
  end
end
