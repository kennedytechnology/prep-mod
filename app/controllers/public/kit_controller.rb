class Public::KitController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      PatientNotifierMailer.kit_created(@patient).deliver
      redirect_to root_path, notice: "Your registration for a COVID-19 Safety Kit has been processed. Thank you."
    else 
      flash[:alert] = "Oops something went wrong. Please try again!"
      render "public/kit/new"
    end
  end

  private
    def patient_params
      params.require(:patient).permit(
        :county, :first_name, :middle_initial, :last_name, :address,
        :state, :city, :zip_code, :number_of_adults,
        :number_of_children, :email, :phone_number,
        :relation_to_patient_for_insurance, :consent_date
      )
    end
end
