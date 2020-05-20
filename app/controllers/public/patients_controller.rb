class Public::PatientsController < ApplicationController

  def clear_session
    session.destroy
    redirect_to "/"
  end
  
  def edit
    edit_gate
    @step = params[:next_step] || "personal_information"
    update && return unless @step == "personal_information"
  end

  def update
    if @patient.update_attributes(patient_params)
      unless @step == "end_flag"
        render "edit", alert: "Success: This step of updating your patient request was saved."
      else
        redirect_to root_path, alert: "Success: Your update patient request was fully saved."
      end
    else
      render "edit", alert: "Your update patient request was not saved."
    end
  end

  private

  def edit_gate
    # To be able to access the consent form (the edit action), you should have
    # entered a registration code and also already selected a clinic. This
    # method handles that.
    @patient = Patient.find(session[:patient_id]) if session[:patient_id] && Patient.exists?(session[:patient_id])
    @patient = Patient.find_by_access_code(params[:access_code]) if params[:access_code]
    session[:patient_id] = @patient.id if @patient

    @clinic = Clinic.find(session[:clinic_id]) if session[:clinic_id] && Clinic.exists?(session[:clinic_id])
    @clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    session[:clinic_id] = @clinic.id if @clinic
    

    if @patient.nil?    
      render :access
      return
    end

    if params[:clinic_id]
      redirect_to "/client/registration"
    end

    if @clinic.nil?
      flash[:notice] = "Access code was successfully processed. Please select a testing location."
      redirect_to "/clinic/search?service[]=Testing"
      return
    end

  end

  def patient_params
    params.require(:patient).permit(:clinic, :clinic_id, :user_id, :student_id, :access_code, :vaccination_status, :clinic_vaccine_id, 
      :clinic_staff_id, :reaction_type, :downloaded_status, :state, :county, :city, :zip_code, :school, 
      :first_name, :last_name, :mothers_maiden_name, :middle_initial, :age, :address, :email, :email_confirmation,
      :date_of_birth, :sex, :phone_number, :relation_to_patient_for_insurance, :insurance_type,
      :insured_first_name, :insured_last_name, :insured_name, :insured_date_of_birth, :type_of_insurance,
      :member_id_for_insurance, :card_number_for_insurance, :group_number_for_insurance, :insurance_company_name, 
      :has_fever_over, :has_cough, :has_difficult_breathing, :had_contact_with_confirmed_case, :is_age_60_or_more, 
      :had_traveled_to_affected_place, :has_risk_factor, :has_other_reason, :other_reason_explanation, :consent_signature,
      :signatory_first_name, :signatory_last_name, :relation_to_patient_for_consent, :consent_date, :password, :password_confirmation,
      :notify_via_sms, :notify_via_email, :appointment_time, :occupation, 
      employer_ids: [])
  end

end
