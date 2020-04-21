class ClinicEventsController < ApplicationController
  layout "clinic_management"
  def new
    @clinic_event = ClinicEvent.new
    @clinic_event.clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    @clinic_event.patient = Patient.find(params[:patient_id])
  end

  def create
    @clinic_event = ClinicEvent.new(clinic_event_params)
    @clinic_event.user = current_user
    if @clinic_event.save
      redirect_to clinic_patients_path(clinic_id: @clinic_event.clinic)
    else
      render "new", alert: "Your entry was not saved."
    end
  end

  def clinic_event_params
    params.require(:clinic_event).permit(:clinic_id, :patient_id, :category, :outcome, :notes)
  end
end
