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

  def capacity; end 

  def uptake; end

  def uptake_by_zip_code
  end

  def locations; end

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