class EmployersController < InheritedResources::Base
  layout "clinic_management", only: [:index]

  def index
    @employers = Employer.all
  end
  
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      redirect_to root_path, notice: "Successfully sent request for Employer Enrollment"
    else
      redirect_to root_path, alert: "Error!"
    end
  end

  private

    def employer_params
      params.require(:employer).permit()
    end

end
