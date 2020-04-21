class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_clinic, only: [:edit, :update]
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

  def edit
  end

  def update
    if @clinic.update(order_update_params)
      flash[:notice] = "Success. Your order was updated successfully!"
    else
      flash[:error] = "Oops something went wrong. Please, try again!"
    end

    redirect_back fallback_location: root_path
  end

  private

  def get_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:clinic_date, :country, :address, :students_registered, :lead_vaccinator_name, users: [],
      clinic_personnel_attributes: [:name, :_destroy]
    )
  end
end
