class ProviderEnrollmentsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def index
    @provider_enrollments = ProviderEnrollment.all
  end

  def new
    @provider_enrollment = ProviderEnrollment.new
  end

  def create
    @provider_enrollment = ProviderEnrollment.new(provider_enrollment_params)

    if @provider_enrollment.save
      redirect_to provider_enrollments_path, notice: "Successfully Added Provider"
    else
      redirect_back fallback_location: provider_enrollments_path, alert: "Error!"
    end
  end

  def edit
    @provider_enrollment = ProviderEnrollment.find(params[:id])
  end

  def update
    @provider_enrollment = ProviderEnrollment.find(params[:id])

    if @provider_enrollment.update(provider_enrollment_params)
      redirect_to provider_enrollments_path, notice: "Successfully Updated Provider"
    else
      redirect_back fallback_location: provider_enrollments_path, alert: "Error!"
    end
  end

  private

    def provider_enrollment_params
      params.require(:provider_enrollment).permit(
        :first_name, :last_name, :address, :phone_number, :fax_number, :email, :npi_number,
        :license_number, :license_type, :medial_specialty, :clinic_service_ids => [],
      )
    end

end
