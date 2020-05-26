class Public::PatientsController < ApplicationController
  helper_method :last_step
  def clear_session
    session.destroy
    redirect_to "/"
  end
  
  def edit    
    edit_gate
    @step = params[:next_step] || "personal_information"
    update && return unless @step == "personal_information"
  end

  def create
    @patient = Patient.new
    edit
  end

  def update  
    @patient.update_attributes(patient_params) if params[:patient]
    
    @patient.patient_family_members.create if @patient.patient_family_members.empty?
    if @step == "add_another_family"
      @patient.patient_family_members.create if @patient.patient_family_members.all?(&:valid?)
      @step = "add_family"
    end

    session['last_step'] = session['this_step']
    session['this_step'] = @step

    if current_step_is_valid?
      unless @step == "end_flag"
        render "edit", alert: "Success: This step of updating your patient request was saved."
      else
        create_family_patients
        redirect_to root_path, alert: "Success: Your update patient request was fully saved."
      end
      
    else
      @step = session['last_step']
      render "edit", alert: "Your update patient request was not saved."
    end


  end
 
  def access
    session[:clinic_id] = nil
    session[:patient_id] = nil
  end

  private

  def current_step_is_valid?
    true
  end

  def last_step  
    return "add_family" if @step == "appointment" && @patient.patient_family_members.any?
    return 'consent_for_services' if @step == 'add_family'
    return nil if @step == 'personal_information'
  
    steps = %w(personal_information health_insurance health_questions consent_for_services appointment)
    steps[steps.index(@step) - 1]
  end

  def create_family_patients
    @patient.patient_family_members.each do |pfm|
      attributes = pfm.attributes
      attributes.delete('id')
      attributes.delete('patient_id')
      attributes['appointment_time'] = pfm.patient.appointment_time
      patient = Patient.create(attributes)
    end
  end

  def load_patient_and_clinic
    @patient = Patient.find(session[:patient_id]) if session[:patient_id] && Patient.exists?(session[:patient_id])
    @patient = Patient.find_by_access_code(params[:access_code]) if params[:access_code]
    session[:patient_id] = @patient.id if @patient

    @clinic = Clinic.find(session[:clinic_id]) if session[:clinic_id] && Clinic.exists?(session[:clinic_id])
    @clinic = Clinic.find(params[:clinic_id]) if params[:clinic_id]
    session[:clinic_id] = @clinic.id if @clinic
  end

  def edit_gate
    load_patient_and_clinic

    if @clinic && (@clinic.public? || @patient)
      @patient ||= Patient.new
      return
    end

    if @patient || (!params[:has_code] && params[:access_code].try(:empty?))
      redirect_to "/clinic/search?service[]=Testing"
      return
    end

    redirect_to "/client/access"
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
      :notify_via_sms, :notify_via_email, :appointment_time, :occupation, :race,
      employer_ids: [],
      patient_family_members_attributes: [:id, :first_name, :middle_initial,
        :last_name, :mothers_maiden_name, :race, :date_of_birth,
        :insurance_company_name, :group_number_for_insurance,
        :member_id_for_insurance, :patient_id]
    )
  end

end
