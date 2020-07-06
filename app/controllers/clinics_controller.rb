class ClinicsController < ClinicManagementController
  before_action :get_clinic, only: [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    # TODO: The details of the searching here should be moved to the model,
    # probably using scopes for a lot of this.

    if params[:q].present?
      @clinics = Clinic.all.select{|c| c.search_string.downcase.include?(params[:q].downcase)}
    elsif sort_column && sort_direction
      @clinics = Clinic.order(sort_column + " " + sort_direction)
    elsif params[:clinic_date]
      params[:clinic_date] == 'past' ? @clinics = Clinic.all.where("clinic_date < ?", Date.current)
          : @clinics = @clinics = Clinic.all.where("clinic_date >= ?", Date.current)
    else 
      @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
    end
  end

  def new
    # TODO: Building the related records should be done in the model.
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
    @clinic.test_kits.build
    @page_title = "Create clinic"
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @page_title = "Create clinic"

    if @clinic.valid?
      params["clinic_dates"].reject(&:blank?).each do |clinic_date|
        @clinic_dup = @clinic.dup
        @clinic_dup.age_groups = @clinic.age_groups
        @clinic_dup.services = @clinic.services
        @clinic_dup.clinic_date = Chronic.parse(clinic_date)
        @clinic_dup.save
        ClinicMailer.public_clinic_created(current_user, @clinic_dup).deliver
      end

      @clinic.save
      ClinicMailer.public_clinic_created(current_user, @clinic).deliver
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
        redirect_to clinics_path(clinic_date: 'upcoming'), notice: "Successfully updated clinic!" 
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
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [], :primary_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
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
