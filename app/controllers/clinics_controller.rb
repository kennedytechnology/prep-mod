class ClinicsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"
  def new
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
  end

  def create
    params[:clinic].parse_time_select! :start_time
    params[:clinic]["start_time"] = params[:clinic]["start_time"].strftime("%H:%M")
    params[:clinic].parse_time_select! :end_time
    params[:clinic]["end_time"] = params[:clinic]["end_time"].strftime("%H:%M")

    @clinic = Clinic.new(clinic_params)
  end

  def index
    @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
  end

  private

  def clinic_params
    params.require(:clinic).permit(
      :clinic_status, :start_time, :end_time,
      :address, :lead_vaccinator_name,
      :clinic_date, :students_registered,
      :incidents_comments, :country, :location, :zip, 
      :city, :state, :appointment_frequency_minutes,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      clinic_personnel_attributes: [:name, :_destroy]
    )
  end
end
