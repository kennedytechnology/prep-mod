class ProviderEnrollmentsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  layout "clinic_management", except: [:new]

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

    if params[:commit] == "Need Additional Information" || params[:commit] == "Accepted" || params[:commit] == "Denied"
      @provider_enrollment.set_status(params[:commit])
    end

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
<<<<<<< HEAD
        :does_provide_vaccination, :does_provide_vfc, :refrigerator, 
        :refrigerator_thermometer, :additional_info, :freezer, 
        :clinic_service_ids => [], :clinic_age_group_ids => [], :clinic_primary_group_ids => []
=======
        :population_served, :high_risk_group_served, :does_provide_vaccination, 
        :does_provide_vfc, :refrigerator, :refrigerator_thermometer, 
        :contact_office_phone, :contact_mobile_phone, :contact_email,
        :practice_backup_office_phone, :practice_backup_mobile_phone,
        :additional_info, :freezer, :clinic_service_ids => [], 
        :clinic_age_group_ids => []
>>>>>>> a70f94d06ae5c47a7f317190cda29cbf9db110ff
      )
    end

end
