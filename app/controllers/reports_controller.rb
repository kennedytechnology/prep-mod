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

  def snapshot; end

  def capacity; end 

  def uptake; end

  def uptake_by_zip_code
  end

  def locations; end

  def appointments_by_county
    render json: Patient.joins(:appointments).group(:county).count
  end 

  def available_and_completed_appointments_by_county
    # render json: Patient.joins(:appointments).where("appointments.queue_state = ? OR appointments.queue_state = ? ", *["not_checked_in", "done"]).group("appointments.queue_state").count
    # render json: Patient.joins(:appointments).where("queue_state = ? OR queue_state = ? ", *["not_checked_in", "done"]).group(:county).group("appointments.queue_state").count
    

    # Patient.where(county: c).joins(:appointments).where("appointments.queue_state = ? OR appointments.queue_state = ? ", *["not_checked_in", "done"]).group("appointments.queue_state").count
    
    
    render json: Patient.joins(:appointments).where("appointments.queue_state = ? OR appointments.queue_state = ? ", *["not_checked_in", "done"]).group(:county).group("appointments.queue_state").count.chart_json
  end 

  def employers; end

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
end