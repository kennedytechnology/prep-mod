class Public::PatientsController < ApplicationController
  def clear_session
    session.destroy
    redirect_to "/client/registration"
  end
  
  def edit
    @patient = Patient.find(session[:patient_id]) if session[:patient_id]
    @patient = Patient.find_by_access_code(params[:access_code]) if params[:access_code]
    
    @step = params[:next_step] || "personal_information"
    
    if @patient
      session[:patient_id] = @patient.id
    else
      render :access
    end
    
  end
end