class ClinicsController < ClinicManagementController
  include ApplicationHelper

  load_and_authorize_resource
  before_action :get_clinic, only: [:edit, :update]

  def index
    # TODO: The details of the searching here should be moved to the model,
    # probably using scopes for a lot of this.
    @q = Clinic.ransack(params[:q])
    @clinics = @q.result.for_user(current_user).order(:clinic_date)

    if params[:clinic_date]
      @clinics = @clinics.past_or_upcoming(params[:clinic_date]).order(:clinic_date)
    end

  end

  def new
    @clinic = Clinic.new
    @clinic.initial_set_up!
    @page_title = "Create Clinic"
    @errors = []
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @page_title = "Create clinic"
    @clinic_dates = params[:clinic_dates].reject(&:blank?)

    @errors = []
    @errors << "You must select at least one clinic date." if @clinic_dates.empty?
    @errors << "You have selected to have multiple clinics on the same date." if @clinic_dates.uniq.size != @clinic_dates.size

    if @clinic.invalid? || @clinic_dates.empty? || @errors.any?
      render :new
    else
      @clinic_dates.each do |clinic_date|
        @clinic_dup = Clinic.new(clinic_params)
        @clinic_dup.clinic_date = Chronic.parse(clinic_date)
        @clinic_dup.save
        @clinic = @clinic_dup
        update_inventory_allocations
        ClinicMailer.public_clinic_created(current_user, @clinic_dup).deliver
      end
      redirect_to clinics_path(clinic_date: 'upcoming'), notice: "Successfully created clinic!"
    end
  end

  def edit
    @page_title = "View/Edit Clinic"
    @title = "View/Edit clinic"
  end

  def edit_queue
    @clinic = Clinic.find(params[:clinic_id])
    @page_title = "Start Virtual Queue"
  end

  def update_queue
    @clinic = Clinic.find(params[:clinic_id])
    @clinic.active_queue_patients_count = params[:clinic][:active_queue_patients_count]
    @clinic.save
    redirect_to clinic_queued_patients_path(@clinic)
  end

  def activity
    raise CanCan::AccessDenied if current_user.has_roles?(:government, :school_nurse)
    @clinic = Clinic.find(params['clinic_id'])
    @clinic.setup_test_kits
    @page_title = "Clinic Activity Form"
  end

  def report
    @clinic = Clinic.find(params['clinic_id'])
    @page_title = "Clinic Activity Report"

    respond_to do |format|
      @clinic_events_for_report = school_mode? ? @clinic.clinic_events.where(category: ["Vaccinated", "Sick", "Absent", "Refused"]).group_by(&:category) : @clinic.clinic_events.where(category: ["Tested", "Cancelled",  "No Show", "Safety Kit", "Screened"]).group_by(&:category)
      format.html
      format.xlsx do
        render xlsx: 'CAF Report', template: 'clinics/report',
        disposition: 'inline',
        filename: "caf_report_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
        xlsx_author: current_user.name
      end
      format.pdf do
        render pdf: "CAF Report",
          page_size: 'A4',
          template: "clinics/report_pdf.html.erb",
          layout: "clinic_print.html.erb",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75,
          encoding: 'utf8'
      end
    end
  end

  def update
    @page_title = "View/Edit clinic"
    @errors = []
    @clinic.default_test_kit = clinic_params['default_test_kit'] if clinic_params['default_test_kit']

    if @clinic.update(clinic_params)
      update_inventory_allocations
      finish_patients_in_queue
      redirect_back fallback_location: clinics_path(clinic_date: 'upcoming'), notice: "Clinic was updated successfully."
    else
      render :new
    end
  end

  def data_transfer
    @clinics = Clinic.all
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.canceled_at = Time.now
    @clinic.save
    redirect_back fallback_location: clinics_path(clinic_date: 'upcoming'), notice: "Successfully canceled clinic."
  end

  private

  def update_inventory_allocations
    if params["supply_inventory_allocation"]
      params["supply_inventory_allocation"].permit!.to_h.each do |k,v|
        @clinic.inventory_allocations.where(supply_inventory_id: k).update(allocated_count: v)
      end
    end
  end

  def finish_patients_in_queue
    return unless clinic_params[:clinic_events_attributes]
    patients_to_finish = clinic_params[:clinic_events_attributes].values.select{|h| h[:category]}.collect{|h| h[:patient_id].to_i}
    @clinic.appointments.where(patient_id: patients_to_finish, queue_state: 'at_clinic').each{|a| a.finish!}
  end

  def get_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(
      :clinic_status, :start_time, :end_time, :location, :public_or_private,
      :address, :lead_vaccinator_name, :social_distancing, :provider_enrollment_id,
      :clinic_date, :default_test_kit,
      :incidents_comments, :county, :venue_name, :zip,
      :city, :state, :appointment_frequency_minutes, :active_queue_patients_count,
      :appointment_slots, :contact_person, :contact_phone_number,
      :backup_contact_person, :backup_contact_phone_number,
      :start_hour_minute, :start_meridiem, :venue_type,
      :end_hour_minute, :end_meridiem, :start_hour, :start_minute, :end_hour, :end_minute,
      :contact_email, :backup_contact_email, :venue_id,
      :appointments_available, users: [], :service_ids => [], :supply_inventory_ids => [],
      :age_group_ids => [], :primary_group_ids => [],
      clinic_personnel_attributes: [:id, :name, :_destroy],
      clinic_events_attributes: [:id, :patient_id, :outcome, :safety_kit_received,
        :contact_type, :clinic_staff_id, :notes, :test_name,
        :test_type, :test_processing, :category],
      test_kits_attributes: [:id, :test_name, :test_manufacturer,
        :test_lot_number, :test_type, :test_processing,
        :test_expiration_date, :test_kits_quantity, :tests_administered,
        :unusable_tests, :tests_returned, :_destroy],
    )
  end
end
