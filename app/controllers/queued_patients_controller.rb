class QueuedPatientsController < ClinicManagementController

  before_action :find_clinic

  def index
    @q = Patient.ransack(params[:q])
    @page_title = "Manage Virtual Queue"
    @patients = @clinic.patients
    @patient = Patient.new
    if @q.result
      @patients = @q.result.page(params[:page]).to_a.uniq
    end
  end

  def send_check_in_reminders
    @clinic.send_reminders
    redirect_to clinic_queued_patients_path(@clinic.id)
  end

  def update_status
    @patient = Patient.find(params[:id])
    raise "Access denied" unless @patient.available_event_names.include?(params[:event])
    @patient.send(params[:event])
    @patient.save
    redirect_back fallback_location: clinic_queued_patients_path(@patient.clinic)
  end

  def update_clinic_status
    # This ensures that the desired state is present in the list of states.
    raise "Access denied" unless @clinic.available_event_names.include?(params[:event])

    @clinic.send(params[:event])
    @clinic.save
    redirect_back fallback_location: clinic_queued_patients_path(@clinic.id)
  end

  private

  def find_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end
end
