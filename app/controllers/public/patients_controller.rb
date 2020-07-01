class Public::PatientsController < ApplicationController
  helper_method :last_step
  def clear_session
    session.destroy
    redirect_to "/"
  end

  def edit 
    load_patient_and_clinic   
    edit_gate
    update if @clinic && @patient
  end


  def update
    @step = params[:next_step]
    @step = "personal_information" if @step.blank?

    load_patient_and_clinic
    parse_dates
    @patient ||= Patient.new
    
    @patient.update(patient_params) if params[:patient]
    @patient.save(validate: false)

    if params[:appointment]
      @appointment = Appointment.new(clinic: @clinic, patient: @patient)
      @appointment.update_attributes(appointment_params)
    end

    session[:patient_id] = @patient.id

    @patient.patient_family_members.create if @patient.patient_family_members.empty? && @step == "add_family"
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
        PublicPatientMailer.request_confirmation(@patient).deliver
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

  def check_in
    # TODO: The check in code should be an attribute of Apppointment, not Patient.
    @patient = Patient.find_by_check_in_code(params[:check_in_code])
    @appointment = @patient.appointments.last
    if @patient.nil?
      render :not_found
      return
    end

    @appointment.check_in! if @appointment.clinic.can_check_in?
  end

  private

  def parse_dates
    return unless params[:patient]
    # TODO: This conversion and parsing should be moved to the model.
    params[:patient][:date_of_birth] = Chronic.parse(params[:patient][:date_of_birth]) if params[:patient][:date_of_birth]
    params[:patient][:insured_date_of_birth] = Chronic.parse(params[:patient][:insured_date_of_birth]) if params[:patient][:insured_date_of_birth]
  end

  def current_step_is_valid?
    # TODO: Validations should be enabled
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
      patient = Patient.create(attributes)
      patient.save(validate: false)
      Appointment.create(patient: patient, clinic: @clinic, appointment_at: @appointment.appointment_at)
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
    # This condition checks if we have a clinic. If we do, it further checks if
    # we can fill out the consent form for that clinic. We can do so if the
    # clinic is public, or if we have a patient loaded from an access code.
    if @clinic && (@clinic.public? || @patient)
      @patient ||= Patient.new
      return
    end

    # This condition checks if we should send the user to find a clinic.
    # We should do so if we have a patient loaded from an access code, or if we
    # don't have an access code.
    if @patient || (!params[:has_code] && params[:access_code].try(:empty?))
      redirect_to "/clinic/search?service[]=Testing"
      return
    end

    # If the previous two conditions did not return, we should ask the user
    # for an access code.
    redirect_to "/client/access"
  end

  def patient_params
    params.require(:patient).permit(:clinic, :clinic_id, :user_id, :student_id,
      :access_code, :vaccination_status, :clinic_vaccine_id, :clinic_staff_id,
      :reaction_type, :downloaded_status, :state, :county, :city, :zip_code,
      :school, :first_name, :last_name, :mothers_maiden_name, :middle_initial,
      :age, :address, :email, :email_confirmation, :date_of_birth, :sex,
      :phone_number, :relation_to_patient_for_insurance, :insurance_type,
      :sharing_results_authorized, :insured_first_name, :insured_last_name,
      :insured_name, :insured_date_of_birth, :type_of_insurance,
      :member_id_for_insurance, :card_number_for_insurance,
      :group_number_for_insurance, :insurance_company_name, :has_fever_over,
      :has_cough, :has_difficult_breathing, :had_contact_with_confirmed_case,
      :is_age_60_or_more, :had_traveled_to_affected_place, :has_risk_factor,
      :has_other_reason, :other_reason_explanation, :consent_signature,
      :signatory_first_name, :signatory_last_name,
      :relation_to_patient_for_consent, :consent_date, :password,
      :password_confirmation, :notify_via_sms, :notify_via_email,
      :appointment_time, :occupation, :race, :signature_data, :has_other_reason_explanation,
      :insurance_card_front, :insurance_card_back, employer_ids: [],
      patient_family_members_attributes: [:id, :first_name, :middle_initial,
        :last_name, :mothers_maiden_name, :race, :date_of_birth,
        :insurance_company_name, :group_number_for_insurance,
        :member_id_for_insurance, :patient_id] )
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_at, :on_waiting_list)
  end

end
