class EmployersController < InheritedResources::Base
  before_action :authenticate_user!, only: [:index]
  layout "clinic_management", only: [:index, :activity]

  def index
    @employers = Employer.all
  end

  def activity
    @page_title = "Employer Activity"
    @employer = Employer.find(params[:id])
  end
  
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      EmployerMailer.request_confirmation(@employer).deliver
      redirect_to root_path, notice: "Successfully sent request for Employer Enrollment"
    else
      redirect_to root_path, alert: "Error!"
    end
  end

  private

    def employer_params
      params.require(:employer).permit(
        :screening_info, :testing_info, :vacination_info, :other_info,
        :business_locations, :first_name, :last_name, :position, :company_name,
        :address_1, :address_2, :city, :zip_code, :state, :office_phone, :mobile_phone,
        :email, :website, :backup_first_name, :backup_last_name, :backup_position,
        :backup_company_name, :backup_address_1, :backup_address_2, :backup_city,
        :backup_zip_code, :backup_state, :total_employees, :total_locations, :comment,
        :backup_email, business_locations: []
      )
    end

end
