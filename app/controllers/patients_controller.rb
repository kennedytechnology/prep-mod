class PatientsController < ApplicationController
  load_and_authorize_resource except: [:anonymized_index]

  layout "clinic_management"
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  before_action :patients_listing, only: [:index, :upload_record]

  def index
    @page_title = "Patient Record Search"

    respond_to do |format|
      format.html
      format.csv { send_data @clinic.patients.to_csv, filename: "news_signups-#{Date.today}.csv" }
      format.xlsx do
        @patients = Patient.with_appointments
        render  template: 'patients/index',
                disposition: 'inline',
                xlsx: 'patients_waiting_list_#{Date.today.strftime("%d_%m_%Y")}.xlsx',
                filename: "patients_waiting_list_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
                xlsx_author: current_user.name
      end
    end

  end

  def anonymized_index
    raise CanCan::AccessDenied unless user.has_role?(:government)
    #TODO Added here for role development
  end

  def new
    @patient = Patient.new
  end

  def create
    params[:patient][:date_of_birth] = Chronic.parse(params[:patient][:date_of_birth]) if params[:patient][:date_of_birth]
    # The patients database table has no clinic_id at this point of development
    # and the below @clinic variable is not used in this method:
    # @clinic = Clinic.find(params[:patient].delete(:clinic_id))
    @patient = Patient.new(patient_params)
    @patient.access_code = Patient.generate_access_code
    @patient.user = current_user if current_user
    if @patient.save
      PatientNotifierMailer.invitation(@patient).deliver if @patient.notify_via_email?
      @patient.sms_invite if @patient.notify_via_sms?
      redirect_back fallback_location: "/patients", notice: "Your patient referral is created."
    else
      render :new, alert: "Your referral was not saved!. Please try again."
    end
  end

  def show
    @patient = Patient.find(params[:id]).decorate
    @patient_clinic_events = @patient.clinic_events.order(event_date: :desc)
    @clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "patient-#{@patient.id}", layout: "clinic-print", show_as_html: params.key?('debug')
      end
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.transaction do
      @patient.appointments.each(&:destroy)
    end
    session[:alert] = "The patient was deleted."
    redirect_back fallback_location: "/clinics"
  end

  def invite_patient_to_register
    @patient = Patient.find(params[:patient_id])
    PatientNotifierMailer.invitation(@patient).deliver
    redirect_back fallback_location: root_path, notice: "Successfully sent invitation!"
  end

  def upload_records
    raise CanCan::AccessDenied if current_user.has_roles?(:staff, :lead_staff, :school_nurse, :government)
  end

  def download_records
    case
    when params[:county] == "" && params[:clinic] == ""
      @patients = Patient.all
    when params[:county] && (params[:clinic] == "")
      @patients = Patient.where(county: params[:county])
    when params[:clinic] && (params[:county] == "")
      @patients = Clinic.find_by_venue_name(params[:clinic]).patients
    else
      @patients = Patient.all
    end
    respond_to do |format|
      format.html
      format.csv { send_data @patients.to_csv, filename: "patients-#{Date.today}.csv" }
    end
  end

  private

  def sort_column
    Patient.where(id: params[:id]).column_names.include?(params[:sort]) ? params[:sort] : "clinic_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def patients_listing
    @q = Patient.ransack(params[:q])

    case
    when params[:clinic_id]
      @clinic = Clinic.includes(appointments: :patient).find(params[:clinic_id])

      @patients = @clinic.patients.order(params.dig(:q, :s)).paginate(page: params[:page], per_page: 250)
    when params[:direction]
      @patients = Patient.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 50)
    when @q.result
      @patients = @q.result.page(params[:page]).to_a.uniq
    else
      @patients = Patient.all.paginate(page: params[:page], per_page: 50)
    end
    @patients = @patients.take(40)
    @patients.uniq!
  end

  def patient_params
    params.require(:patient).permit(:clinic, :clinic_id, :user_id, :student_id,
      :access_code, :vaccination_status, :clinic_vaccine_id, :clinic_staff_id,
      :reaction_type, :downloaded_status, :state, :county, :city, :zip_code,
      :school, :first_name, :last_name, :mothers_maiden_name, :middle_initial,
      :age, :address, :email, :email_confirmation, :date_of_birth, :sex,
      :phone_number, :relation_to_patient_for_insurance, :insurance_type, :race,
      :insured_first_name, :insured_last_name, :insured_name,
      :insured_date_of_birth, :type_of_insurance, :member_id_for_insurance,
      :card_number_for_insurance, :group_number_for_insurance,
      :insurance_company_name, :has_fever_over, :has_caugh,
      :has_difficult_breathing, :had_contact_with_confirmed_case,
      :is_age_60_or_more, :had_traveled_to_affected_place, :has_risk_factor,
      :has_other_reason, :other_reason_explanation, :consent_signature,
      :relation_to_patient_for_consent, :consent_date, :password,
      :password_confirmation, :notify_via_sms, :notify_via_email, :occupation)
  end

end
