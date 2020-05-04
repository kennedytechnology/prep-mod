class ClinicsController < ClinicManagementController
  before_action :get_clinic, only: [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    if params[:q].present?
      @clinics = Clinic.all.select{|c| c.search_string.downcase.include?(params[:q].downcase)}
    elsif sort_column && sort_direction
      @clinics = Clinic.order(sort_column + " " + sort_direction)
    else 
      @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
    end
  end

  def new
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
    @clinic.test_kits.build
  end

  def create
    @clinic = Clinic.new(clinic_params)

    if @clinic.save
      redirect_to "/clinics"
    else
      render "new", alert: "Your clinic entry was not saved." + @clinic.errors.to_s
    end
  end

  def edit
  end

  def activity
    @clinic = Clinic.find(params['clinic_id'])
  end

  def update
    if @clinic.update(clinic_params)
      flash[:notice] = "Success. Clinic was updated successfully!"
    else
      flash[:error] = "Oops something went wrong. Please, try again!"
    end

    if params['save-submit']
      redirect_to "/clinics"
    else
      redirect_back fallback_location: root_path
    end
  end

  private

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
      :clinic_status, :start_time, :end_time,
      :address, :lead_vaccinator_name,
      :clinic_date, :students_registered,
      :incidents_comments, :county, :venue_name, :zip, 
      :city, :state, :appointment_frequency_minutes,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      :start_hour_minute, :start_meridiem,
      :end_hour_minute, :end_meridiem, :start_hour, :start_minute, :end_hour, :end_minute,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received,
        :contact_type, :screening_outcome, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing, 
        :test_expiration_date, :test_kits_quantity, :tests_administered, 
        :unusable_tests, :tests_returned, :_destroy]
    )
  end
end
