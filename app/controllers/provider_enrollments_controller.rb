class ProviderEnrollmentsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def index
    @provider_enrollments = ProviderEnrollment.all
    @provider_enrollment = ProviderEnrollment.new
  end

  def new
    @provider_enrollment = ProviderEnrollment.new
  end

  def create
    @provider_enrollment = ProviderEnrollment.new(provider_enrollment_params)

    if @provider_enrollment.save
      redirect_to provider_enrollments_path#(clinic_id: @supply_inventory.clinic), notice: "Successfully Added Inventory Item"
    else
      redirect_back fallback_location: provider_enrollments_path#(clinic_id: @supply_inventory.clinic), alert: "Error!"
    end
  end

  def edit
    @provider_enrollment = ProviderEnrollment.find(params[:id])
  end

  def update
    @provider_enrollment = ProviderEnrollment.find(params[:id])

    if @provider_enrollment.update(provider_enrollment_params)
      redirect_to provider_enrollments_path#(clinic_id: @supply_inventory.clinic), notice: "Successfully Updated Inventory Item"
    else
      redirect_back fallback_location: provider_enrollments_path#(clinic_id: @supply_inventory.clinic), alert: "Error!"
    end
  end

  private

    def provider_enrollment_params
      params.require(:provider_enrollment).permit(
        :first_name, :last_name, :manufacturer, :address, :phone_number, :fax_number, :email, :npi_number,
        :license_number, :license_type, :medical_specialty
      )
    end

end
