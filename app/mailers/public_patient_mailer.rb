class PublicPatientMailer < ApplicationMailer
  def request_confirmation(patient)
    @patient = patient
    mail to: patient.email, subject: "Confirmation for your request about COVID-19 testing."
  end
end
