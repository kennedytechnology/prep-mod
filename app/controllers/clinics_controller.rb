class ClinicsController < ClinicManagementController

  before_action :get_clinic, only: [:edit, :update]

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

  def index
    @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
    if params[:q].present?
      @clinics = @clinics.select{|c| c.search_string.downcase.include?(params[:q].downcase)}
    end
  end

  def edit
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
      :end_hour_minute, :end_meridiem,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
      :test_lot_number, :test_type, :test_processing, 
      :test_expiration_date, :test_kits_quantity, :tests_administered, 
      :unusable_tests, :tests_returned, :_destroy]
    )
  end
end
