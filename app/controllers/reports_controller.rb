class ReportsController < ApplicationController
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

  def employers_speciality
    render json:  ProviderEnrollment.group(:medical_specialty).count
  end 

  def employers_regions
    render json: ProviderEnrollment.group(:practice_city).count
  end

  def employers_patients_tested
  end

  def employers_vacine_inventory
    render json: SupplyInventory.group(:item_type).count
  end

  def supply_inventories; end

  def customized; end

  def available_and_completed_appointments
    render json: Appointment.where("queue_state = ? OR queue_state = ? ", *["not_checked_in", "done"]).group(:queue_state).count
  end
end