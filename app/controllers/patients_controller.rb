class PatientsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to root_path
    else
      render "new", :alert => "Your request WAS NOT saved!"
    end
  end

  def edit
  end

private

def patient_params
  params.require(:patient).permit(:state, :county, :city, :school, :email, :phone_number, :first_name, :last_name, :mother_maiden_name, :date_of_birth,  :password, :password_confirmation, :age, :sex)
end

end
