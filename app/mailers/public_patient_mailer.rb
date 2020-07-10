class PublicPatientMailer < ApplicationMailer
  def request_confirmation(patient, clinic)
    @patient = patient
    @clinic = clinic
    @appointment = patient.appointments.find_by(clinic_id: clinic.id)
    mail to: patient.email, subject: "Confirmation for your request about COVID-19 testing."
  end
end
