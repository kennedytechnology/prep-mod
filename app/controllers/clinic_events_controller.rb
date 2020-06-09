class ClinicEventsController < ClinicManagementController
  def index
    @clinic = Clinic.find(params[:clinic_id])
    @clinic_events = @clinic.clinic_events
  end

  def new
    @clinic_event = ClinicEvent.new
    @clinic_event.clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    @clinic_event.patient = Patient.find(params[:patient_id])
  end

  def create
    params[:clinic_event][:event_date] = Chronic.parse(params[:clinic_event][:event_date]) if params[:clinic_event][:event_date]
    @clinic_event = ClinicEvent.new(clinic_event_params)
    @clinic_event.user = current_user
    if @clinic_event.save
      redirect_to patients_path
    else
      render "new", alert: "Your entry was not saved."
    end
  end

  def destroy
    @clinic_event = ClinicEvent.find(params[:id])
    @patient = @clinic_event.patient
    @clinic_event.destroy
    redirect_back fallback_location: @patient
  end

  def update
    params[:clinic_event][:event_date] = Chronic.parse(params[:clinic_event][:event_date]) if params[:clinic_event][:event_date]
    @clinic_event = ClinicEvent.find(params[:id])
    if @clinic_event.update(clinic_event_params)
    else
      flash[:error] = "Oops something went wrong. Please, try again!"
    end
    redirect_back fallback_location: root_path
  end

  def clinic_event_params
    params.require(:clinic_event).permit(
      :clinic_id, :patient_id, :category, :outcome,
      :notes, :contact_type, :screening_outcome,
      :test_name, :test_type, :test_processing, :clinic_staff_id,
      :event_date, :location, clinic_service_ids: []
    )
  end
end
