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
      params.require(:employer).permit(
        :screening_info, :testing_info, :vacination_info, :other_info,
        :business_locations, :first_name, :last_name, :position, :company_name,
        :address_1, :address_2, :city, :zip_code, :state, :office_phone, :mobile_phone,
        :email, :website, :backup_first_name, :backup_last_name, :backup_position,
        :backup_company_name, :backup_address_1, :backup_address_2, :backup_city,
        :backup_zip_code, :backup_state, :total_employees, :total_locations,
        business_locations: []
      )
    end

end
