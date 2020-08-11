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
    @clinic_event = ClinicEvent.new(clinic_event_params)
    @clinic_event.user = current_user
    respond_to do |format|
      format.html do
        if @clinic_event.save
          ClinicEventMailer.registration_confirmed(@clinic_event).deliver_now
          redirect_to patients_path
        else
          render "new", alert: "Your entry was not saved."
        end
      end
      format.js do
        @clinic_event.save
      end
    end

  end

  def destroy
    @clinic_event = ClinicEvent.find(params[:id])
    @patient = @clinic_event.patient
    @clinic_event.destroy
    redirect_back fallback_location: @patient
  end

  def update
    @clinic_event = ClinicEvent.find(params[:id])
    if @clinic_event.update(clinic_event_params)
    else
      flash[:error] = "Oops something went wrong. Please, try again!"
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js
    end

  end

  def clinic_event_params
    params.require(:clinic_event).permit(
      :clinic_id, :patient_id, :category, :outcome,
      :notes, :contact_type, :safety_kit_received,
      :test_name, :test_type, :test_processing, :clinic_staff_id,
      :is_refused, :is_sick, :is_absent,
      :event_date, :location, clinic_service_ids: []
    )
  end
end
