class ClinicsController < ClinicManagementController
  load_and_authorize_resource except: [:index]
  before_action :get_clinic, only: [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    # TODO: The details of the searching here should be moved to the model,
    # probably using scopes for a lot of this.
    @q = Clinic.ransack(params[:q])
    @clinics = Clinic.all.order(:clinic_date)

    if params[:clinic_date]
      @clinics = Clinic.past_or_upcoming(params[:clinic_date]).order(:clinic_date)
    end

    if @q.result
      @clinics = @q.result.order(:clinic_date)
    end
  end

  def new
    @clinic = Clinic.new
    @clinic.initial_set_up!
    @page_title = "Create clinic"
    @clinic_dates = @clinic.clinic_dates.build
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @page_title = "Create clinic"

    if @clinic.valid?
      @clinic.clinic_dates.map(&:date_of_clinic).each do |clinic_date|
        @clinic_dup = Clinic.new(clinic_params)
        @clinic_dup.clinic_date = Chronic.parse(clinic_date)
        @clinic_dup.save
        ClinicMailer.public_clinic_created(current_user, @clinic_dup).deliver
      end

      redirect_to clinics_path(clinic_date: 'upcoming'), notice: "Successfully created clinic!"
    else
      render :new
    end
  end

  def edit
    @page_title = "View/Edit Clinic"
    @title = "View/Edit clinic"
  end

  def edit_queue
    @clinic = Clinic.find(params[:clinic_id])
    @page_title = "Start Virtual Queue"
  end

  def update_queue
    @clinic = Clinic.find(params[:clinic_id])
    @clinic.active_queue_patients_count = params[:clinic][:active_queue_patients_count]
    @clinic.save
    redirect_to clinic_queued_patients_path(@clinic)
  end

  def activity
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @clinic = Clinic.find(params['clinic_id'])
    @page_title = "Clinic Activity Form"
  end

  def report
    @clinic = Clinic.find(params['clinic_id'])
    @page_title = "Clinic Activity Report"
  end

  def update
    @page_title = "View/Edit clinic"
    if @clinic.update(clinic_params)
      finish_patients_in_queue
      redirect_back fallback_location: clinics_path(clinic_date: 'upcoming')
    else
      render :new
    end
  end

  def data_transfer
    @clinics = Clinic.all
  end

  private

  def finish_patients_in_queue
    return unless clinic_params[:clinic_events_attributes]
    patients_to_finish = clinic_params[:clinic_events_attributes].values.select{|h| h[:category]}.collect{|h| h[:patient_id].to_i}
    @clinic.appointments.where(patient_id: patients_to_finish, queue_state: 'at_clinic').each{|a| a.finish!}
  end

  def sort_column
    Clinic.where(id: params[:id]).column_names.include?(params[:sort]) ? params[:sort] : nil
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
  end

  def get_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(
      :clinic_status, :start_time, :end_time, :location, :public_or_private,
      :address, :lead_vaccinator_name, :social_distancing, :provider_enrollment_id,
      :clinic_date, :students_registered, :default_test_kit,
      :incidents_comments, :county, :venue_name, :zip,
      :city, :state, :appointment_frequency_minutes, :active_queue_patients_count,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      :start_hour_minute, :start_meridiem, :venue_type,
      :end_hour_minute, :end_meridiem, :start_hour, :start_minute, :end_hour, :end_minute,
      :contact_email, :backup_contact_email,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [], :primary_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_dates_attributes: [:id, :date_of_clinic, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received,
        :contact_type, :screening_outcome, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing,
        :test_expiration_date, :test_kits_quantity, :tests_administered,
        :unusable_tests, :tests_returned, :_destroy],
    )
  end
end
