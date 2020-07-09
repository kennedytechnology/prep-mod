class QueuedPatientsController < ClinicManagementController
  before_action :find_clinic

  def index
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @page_title = "Manage Virtual Queue"
    auto_invite
    @clinic.reload
    @patients = @clinic.patients
    @patient = Patient.new
  end

  def send_check_in_reminders
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @clinic.send_reminders
    redirect_to clinic_queued_patients_path(@clinic.id)
  end

  def send_check_in_reminder
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @appointment = @clinic.appointments.find(params[:appointment_id])
    AppointmentMailer.send_reminder(@appointment).deliver
    @appointment.send_sms_reminder(@appointment.patient.phone_number)
    redirect_to clinic_queued_patients_path(@clinic.id)
  end

  def update_status
    @appointment = Appointment.find(params[:id])
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    raise CanCan::AccessDenied unless @appointment.available_event_names.include?(params[:event])
    @appointment.send(params[:event])
    @appointment.save
    redirect_back fallback_location: clinic_queued_patients_path(@appointment.clinic)
  end

  def update_clinic_status
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    raise CanCan::AccessDenied unless @clinic.available_event_names.include?(params[:event])

    @clinic.send(params[:event])
    @clinic.save
    redirect_back fallback_location: clinic_queued_patients_path(@clinic.id)
  end

  private

  def auto_invite
    @clinic.appointments_to_invite.each(&:invite!) if @clinic.opened?
  end

  def find_clinic
    @clinic = Clinic.includes(appointments: :patient).find(params[:clinic_id])
  end
end
