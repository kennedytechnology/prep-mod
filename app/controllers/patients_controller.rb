class PatientsController < ApplicationController
  layout "clinic_management"
  before_action :authenticate_user!

  def index
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
  params.require(:patient).permit(:clinic, :clinic_id, :user_id, :student_id, :access_code, :vaccination_status, :clinic_vaccine_id, 
                                  :clinic_staff_id, :reaction_type, :downloaded_status, :state, :county, :city, :zip_code, :school, 
                                  :first_name, :last_name, :mothers_maiden_name, :middle_initial, :age, :address, :email, :email_confirmation,
                                  :date_of_birth, :sex, :phone_number, :relation_to_patient_for_insurance, :insurance_type,
                                  :insured_first_name, :insured_last_name, :insured_name, :insured_date_of_birth, :type_of_insurance,
                                  :member_id_for_insurance, :card_number_for_insurance, :group_number_for_insurance,:insurance_company_name, 
                                  :has_fever_over, :has_caugh, :has_difficult_breathing, :had_contact_with_confirmed_case, :is_age_60_or_more, :had_traveled_to_affected_place, :has_risk_factor, :has_other_reason, :other_reason_explanation, :consent_signature, :relation_to_patient_for_consent, :consent_date, :password, :password_confirmation, :notify_via_sms, :notify_via_email)
end
