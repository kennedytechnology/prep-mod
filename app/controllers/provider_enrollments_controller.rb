class ProviderEnrollmentsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
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
        :first_name, :last_name, :middle_initial, 
        :practice_address, :practice_office_phone, :practice_mobile_phone, 
        :practice_fax_number, :practice_email, :title, 
        :npi_number, :license_number, :license_type, 
        :medical_specialty, :professional_license, :license_date_of_issue, 
        :license_state_of_issue, :practice_type, :practice_name, 
        :practice_city, :practice_state, :practice_zip_code, 
        :practice_backup_contact, :practice_backup_phone, :practice_backup_email, 
        :population_served, :high_risk_group_served, :does_provide_vaccination, 
        :does_provide_vfc, :refrigerator, :refrigerator_thermometer, 
        :additional_info, :clinic_service_ids => [],         
      )
    end

end
