class ClinicsController < ClinicManagementController
  before_action :get_clinic, only: [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    # TODO: The details of the searching here should be moved to the model,
    # probably using scopes for a lot of this.

    if params[:q].present?
      @clinics = Clinic.all.select{|c| c.search_string.downcase.include?(params[:q].downcase)}
    elsif sort_column && sort_direction
      @clinics = Clinic.order(sort_column + " " + sort_direction)
    elsif params[:clinic_date]
      params[:clinic_date] == 'past' ? @clinics = Clinic.all.where("clinic_date < ?", Date.current)
          : @clinics = @clinics = Clinic.all.where("clinic_date >= ?", Date.current)
    else 
      @clinics = Clinic.all.paginate(page: params[:page], per_page: 50)
    end
  end

  def new
    # TODO: Building the related records should be done in the model.
    @clinic = Clinic.new
    @clinic.clinic_personnel.build
    @clinic.test_kits.build
    @page_title = "Create clinic"
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @page_title = "Create clinic"

    respond_to do |format|
      if params[:reviewed] == "false"
        format.js { render 'clinics/preview_form', locals: {clinic_params: clinic_params} }
      else 
        if @clinic.valid?
          params["clinic_dates"].reject(&:blank?).each do |clinic_date|
            @clinic_dup = @clinic.dup
            @clinic_dup.clinic_date = Chronic.parse(clinic_date)
            @clinic_dup.save
            ClinicMailer.public_clinic_created(current_user, @clinic_dup).deliver
          end

          ClinicMailer.public_clinic_created(current_user, @clinic).deliver
          format.html { redirect_to clinics_path(clinic_date: 'upcoming'), notice: "Successfully created clinic!" }
        else
          format.html { render :new }
        end
      end
    end
  end

  def edit
    @page_title = "Edit Clinic"
    @title = "Edit clinic"
  end

  def activity
    @clinic = Clinic.find(params['clinic_id'])
    @page_title = "Clinic Activity Form"
  end

  def update
    @page_title = "Edit clinic"
    respond_to do |format|
      if params[:reviewed] == "false"
        format.js { render 'clinics/preview_form', locals: {clinic_params: clinic_params} }
      else 
        if @clinic.update(clinic_params)
          format.html { redirect_to clinics_path(clinic_date: 'upcoming'), notice: "Successfully updated clinic!" }
        else
          format.html { render :new }
        end
      end
    end
  end

  def data_transfer
    @clinics = Clinic.all
  end

  private

  def sort_column
    Clinic.where(id: params[:id]).column_names.include?(params[:sort]) ? params[:sort] : nil
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : nil
  end

  def get_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(
      :clinic_status, :start_time, :end_time, :location, :public_or_private,
      :address, :lead_vaccinator_name, :provider_enrollment_id,
      :clinic_date, :students_registered, :default_test_kit,
      :incidents_comments, :county, :venue_name, :zip, 
      :city, :state, :appointment_frequency_minutes,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      :start_hour_minute, :start_meridiem, :venue_type,
      :end_hour_minute, :end_meridiem, :start_hour, :start_minute, :end_hour, :end_minute,
      :appointments_available, users: [], :service_ids => [],
      :age_group_ids => [], :primary_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received,
        :contact_type, :screening_outcome, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing, 
        :test_expiration_date, :test_kits_quantity, :tests_administered, 
        :unusable_tests, :tests_returned, :_destroy],
    )
  end
end
