class PopulateClinicAppointmentsCount < ActiveRecord::Migration[6.0]
  def up
    Clinic.find_each do |clinic|
      Clinic.reset_counters(clinic.id, :appointments)
    end
  end
end
