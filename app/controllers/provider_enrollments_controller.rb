class ProviderEnrollmentsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  layout "clinic_management", except: [:new]

  def index
    @provider_enrollments = ProviderEnrollment.all
  end

  def new
    @provider_enrollment = ProviderEnrollment.new
    @title = "Request to Become a COVID-19 Service Provider"
  end

  def create
    @provider_enrollment = ProviderEnrollment.new(provider_enrollment_params)
    @title = "Request to Become a COVID-19 Service Provider"

    respond_to do |format|
      if params[:reviewed] == "false"
        format.js { render 'provider_enrollments/preview_form', locals: {provider_enrollment_params: provider_enrollment_params} }
      else 
        if @provider_enrollment.update(provider_enrollment_params)
          ProviderEnrollmentMailer.request_confirmation(@provider_enrollment).deliver
          format.html { redirect_to root_path, notice: "Your Request to Become a COVID-19 Service Provider is successfully submitted!" }
        else
          format.html { render :new }
        end
      end
    end
  end

  def edit
    @provider_enrollment = ProviderEnrollment.find(params[:id])
    @title = "COVID-19 Service Provider Request from #{@provider_enrollment.first_name} #{@provider_enrollment.last_name}"
  end

  def update
    @provider_enrollment = ProviderEnrollment.find(params[:id])
    @title = "COVID-19 Service Provider Request from #{@provider_enrollment.first_name} #{@provider_enrollment.last_name}"

    respond_to do |format|
      if params[:reviewed] == "false"
        format.js { render 'provider_enrollments/preview_form', locals: {provider_enrollment_params: provider_enrollment_params} }
      else 
        if @provider_enrollment.update(provider_enrollment_params)
          format.html { redirect_to provider_enrollments_path, notice: "Successfully update provider enrollment!" }
        else
          format.html { render :new }
        end
      end
    end
  end

  private

    def provider_enrollment_params
      params.require(:provider_enrollment).permit(
        :first_name, :last_name, :middle_initial, :status, 
        :practice_address, :practice_office_phone, :practice_mobile_phone, 
        :practice_fax_number, :practice_email, :title, 
        :npi_number, :license_number, :license_type, 
        :medical_specialty, :professional_license, :license_date_of_issue, 
        :license_state_of_issue, :practice_type, :practice_name, 
        :practice_city, :practice_state, :practice_zip_code, 
        :practice_backup_contact, :practice_backup_phone, :practice_backup_email, 
        :does_provide_vaccination, :does_provide_vfc, :refrigerator, 
        :refrigerator_thermometer, :contact_office_phone, :contact_mobile_phone, 
        :contact_email, :practice_backup_office_phone, :practice_backup_mobile_phone,
        :additional_info, :freezer, :county, :clinic_service_ids => [], 
        :clinic_age_group_ids => [], :clinic_primary_group_ids => [])
    end

end
