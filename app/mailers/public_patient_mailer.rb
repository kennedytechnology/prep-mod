class PublicPatientMailer < ApplicationMailer
  def request_confirmation(patient, clinic)
    @patient = patient
    @clinic = clinic
    @appointment = patient.appointments.find_by(clinic_id: clinic.id)

    message = {appointment_id: @appointment.id}
    @cancel_appointment = ActiveSupport::MessageVerifier.new(ENV['MAILING_SECRET']).generate(message)

    I18n.with_locale(locale) do
      mail to: patient.email
    end
  end
end
