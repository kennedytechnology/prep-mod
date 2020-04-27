class ClinicsController < ClinicManagementController

  before_action :get_clinic, only: [:edit, :update]

  def new
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
  end

  def create
    # params[:clinic].parse_time_select! :start_time
    # params[:clinic]["start_time"] = params[:clinic]["start_time"].strftime("%H:%M")
    # params[:clinic].parse_time_select! :end_time
    # params[:clinic]["end_time"] = params[:clinic]["end_time"].strftime("%H:%M")
    debugger
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      redirect_to "/clinics"
    else
      render "new", alert: "Your clinic entry was not saved." + @clinic.errors.to_s
    end
    
  end

  def index
    @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
    if params[:patient_id]
      @clinics = Patient.find(params[:patient_id]).clinics.order(params[:sort]).paginate(page: params[:page], per_page: 50)
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

    redirect_back fallback_location: root_path
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
      :start_hour, :start_minute, :start_meridiem,
      :end_hour, :end_minute, :end_meridiem,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [],
      clinic_personnel_attributes: [:name, :_destroy],
    )
  end
end
