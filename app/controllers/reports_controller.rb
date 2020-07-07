class ReportsController < ApplicationController
  include ReportHelper
  layout "clinic_management"
  before_action :authenticate_user!

  def providers; end

  def providers_by_county
    render json: ProviderEnrollment.group(:county).count
  end

  def providers_by_specialty
    render json: ProviderEnrollment.group(:medical_specialty).count
  end

  def snapshot_tested
    render json: ClinicEvent.where(outcome: ["Positive", "Negative"]).group(:outcome).count
  end

  def capacity_available_testing_appointments
    render json:  Clinic.joins(:appointments).all.group(:venue_name).count
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


  def uptake; end
  def uptake_by_zip_code
  end

  def locations; end

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

  def supply_inventories; end

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

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Customized report",
                page_size: 'A4',
                template: "reports/news_and_notifications.pdf.erb",
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
