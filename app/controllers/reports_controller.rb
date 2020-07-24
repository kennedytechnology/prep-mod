class ReportsController < ApplicationController
  include ReportHelper
  before_action :authenticate_user!
  layout "clinic_management"

  def providers
    @providers_by_specialty = ProviderEnrollment.group(:medical_specialty).count
    @providers_by_county = ProviderEnrollment.group(:county).count

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/providers.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def providers_by_county
    render json: ProviderEnrollment.group(:county).count
  end

  def providers_by_specialty
    render json: ProviderEnrollment.group(:medical_specialty).count
  end

  def snapshot_tested
    @results = ClinicEvent.where(outcome: ["Positive", "Negative"]).group(:outcome).count

    respond_to do |format|
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/snapshot.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
      format.json do
        render json: @results
      end
    end
  end

  def capacity
    @available_appointments = Clinic.joins(:appointments).all.group(:venue_name).count 
    @scheduled_appointments = Clinic.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:venue_name).count
    @available_appointments_by_county = Clinic.joins(:appointments).all.group(:county).count
    @scheduled_appintments_by_county = Clinic.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:county).count

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/capacity.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def capacity_available_testing_appointments
    render json: Clinic.joins(:appointments).all.group(:venue_name).count
  end

  def capacity_scheduled_appointments
    render json: Clinic.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:venue_name).count
  end

  def capacity_available_testing_appointments_by_county
    chart_data = Clinic.joins(:appointments).all.group(:county).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def capacity_scheduled_appointments_by_county
    chart_data = Clinic.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:county).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def uptake
    @results = Appointment.where("queue_state = ? OR queue_state = ? ", *["not_checked_in", "done"]).group(:queue_state).count
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/uptake.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def uptake_by_zip_code; end

  def locations
    @appointments_by_county = Patient.joins(:appointments).group(:county).count
    @available_appointments_by_county = Patient.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:county).count
    @completed_appointments_by_county = Patient.joins(:appointments).where("appointments.queue_state = ?", "done").group(:county).count

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/locations.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def employers
    @employers_by_state = Employer.group(:state).count
    @employers_patients_tested_company_name = Employer.joins(:patients).group(:company_name).count
    @employers_patients_tested_city = Employer.joins(:patients).group(:city).count

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/employers.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def employers_state
    render json: Employer.group(:state).count
  end

  def employers_patients_tested_company_name
    render json: Employer.joins(:patients).group(:company_name).count
  end

  def employers_patients_tested_city
    render json: Employer.joins(:patients).group(:city).count
  end

  def appointments_by_county
    render json: Patient.joins(:appointments).group(:county).count
  end

  def available_appointments_by_county
    chart_data = Patient.joins(:appointments).where("appointments.queue_state = ?", "not_checked_in").group(:county).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def completed_appointments_by_county
    chart_data = Patient.joins(:appointments).where("appointments.queue_state = ?", "done").group(:county).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def supply_inventories
    @supply_inventories_by_county = SupplyInventory.group(:county).count
    @supply_inventories_by_venue_name = SupplyInventory.group(:venue_name).count

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/supply_inventories.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def supply_inventories_by_county
    chart_data = SupplyInventory.group(:county).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def supply_inventories_by_venue_name
    chart_data = SupplyInventory.group(:venue_name).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def customized; end

  def available_and_completed_appointments
    render json: Appointment.where("queue_state = ? OR queue_state = ? ", *["not_checked_in", "done"]).group(:queue_state).count
  end


  def news_and_notifications
    @news_signups = NewsSignup.all
    @news_signups_by_occupation = NewsSignup.group(:occupation).count
    @news_signups_with_chronic_health_condition = NewsSignup.group(:chronic_health_condition).count

    template_name = params[:is_report] ? "news_and_notifications_report" : "news_and_notifications"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/#{template_name}.pdf.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
      format.xlsx do
        render xlsx: 'New and Notifications Contact List', template: 'reports/news_and_notifications',
                disposition: 'inline',
                filename: "news_and_notifications_contact_list_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
                xlsx_author: current_user.name
      end
    end
  end

  def news_signups_by_occupation
    chart_data = NewsSignup.group(:occupation).count
    render json: [{ data: parse_chart_data(chart_data),
                    library: column_chart_background_colors }].chart_json
  end

  def news_signups_with_chronic_health_condition
    render json: NewsSignup.group(:chronic_health_condition).count
  end
end
