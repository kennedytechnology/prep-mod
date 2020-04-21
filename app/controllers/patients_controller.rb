class PatientsController < ApplicationController
  layout "clinic_management"
  before_action :authenticate_user!

  def index
    @patients = Patient.all
    if params[:clinic_id]
      @clinic = Clinic.find(params[:clinic_id])
      @patients = @clinic.patients
    end
    if params[:q].present?
      @patients = @patients.select{|p| p.search_string.include?(params[:q])}
    end
    @patients = @patients.take(40)
  end

  def show
  end

  def new
    @patient = Patient.new  
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.access_code = Patient.generate_access_code
    if @patient.save
      PatientNotifierMailer.invitation(@patient).deliver if @patient.notify_via_email?
      @patient.sms_invite if @patient.notify_via_sms?
      redirect_to edit_patient_path(@patient), :alert => "Your patient referral is created."
    else
      render "new", :alert => "Your referral was not saved!"
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

private

def patient_params
  params.require(:patient).permit(:clinic, :clinic_id, :middle_initial, :address, :zip_code, :state, :county, :city, :school, :email, :phone_number, :first_name, :last_name, :mothers_maiden_name, :date_of_birth,  :password, :password_confirmation, :age, :sex, :notify_via_sms, :notify_via_email)
end

end
