class ClinicEventsController < ClinicManagementController
  def new
    @clinic_event = ClinicEvent.new
    @clinic_event.clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    @clinic_event.patient = Patient.find(params[:patient_id])
  end

  def create
    @clinic_event = ClinicEvent.new(clinic_event_params)
    @clinic_event.user = current_user
    if @clinic_event.save
      redirect_back fallback_location: clinic_events_path(clinic_id: @clinic_event.clinic)
    else
      render "new", alert: "Your entry was not saved."
    end
  end

  def update
    @clinic_event = ClinicEvent.find(params[:id])
    if @clinic_event.update(clinic_event_params)
      
    else
      flash[:error] = "Oops something went wrong. Please, try again!"
    end

    redirect_back fallback_location: root_path
  end

  def index
    @clinic = Clinic.find(params[:clinic_id])
    @clinic_events = @clinic.clinic_events
  end

  def clinic_event_params
    params.require(:clinic_event).permit(:clinic_id, :patient_id, :category, :outcome, :notes, :contact_type, :screening_outcome, :test_name, :test_type, :test_processing, :clinic_staff_id)
  end
end
