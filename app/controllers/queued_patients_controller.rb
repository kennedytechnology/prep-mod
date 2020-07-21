class QueuedPatientsController < ClinicManagementController
  skip_before_action :authenticate_user!, only: [:cancel_appointment]
  before_action :find_clinic

  def index
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @page_title = "Manage Virtual Queue"
    auto_invite
    @clinic.reload; @clinic.patients.reload; @clinic.appointments.reload
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
    auto_invite
    @clinic.reload; @clinic.patients.reload; @clinic.appointments.reload
    respond_to do |format|
      format.html { redirect_back fallback_location: clinic_queued_patients_path(@appointment.clinic) }
      format.js
    end
    
  end

  def update_clinic_status
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    raise CanCan::AccessDenied unless @clinic.available_event_names.include?(params[:event])

    @clinic.send(params[:event])
    @clinic.save
    redirect_back fallback_location: clinic_queued_patients_path(@clinic.id)
  end

  def update_appointment
    @appointment = Appointment.find_by(patient_id: params[:patient_id], clinic_id: params[:clinic_id], on_waiting_list: true)

    if @appointment
      @appointment.on_waiting_list = false
      if @appointment.update(appointment_params)
        flash[:notice] = "Successfully added appointment"
      else
        flash[:alert] = "Error!"
      end
    end

    redirect_back fallback_location: clinic_queued_patients_path(clinic_id: params[:clinic_id])
  end

  def cancel_appointment
    @appointment = Appointment.find(params[:appointment_id])

    if @appointment.queue_state == "canceled"
      flash[:alert] = "Your appointment is already canceled."
    elsif @appointment.send("cancel")
      @appointment.save
      AppointmentMailer.appointment_canceled(@appointment).deliver
      flash[:notice] = "Your appointment is successfully cancelled."
    else
      flash[:alert] = "Error! Your appointment wasn't cancelled. Please try again or contact our regional administrator."
    end

    redirect_to root_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_at)
  end

  def auto_invite
    @clinic.appointments_to_invite.each(&:invite!) if @clinic.opened?
  end

  def find_clinic
    @clinic = Clinic.includes(appointments: :patient).find(params[:clinic_id])
  end
end
