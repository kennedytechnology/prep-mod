class ClinicsController < ApplicationController
  def new
    @clinic = Clinic.new
  end

  def create
  end

  def index
  end

  private

  def clinic_params
    params.require(:clinic).permit()
  end
end
