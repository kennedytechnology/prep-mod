# Preview all emails at http://localhost:3000/rails/mailers/clinic_event_mailer
class ClinicEventMailerPreview < ActionMailer::Preview
  def patient_checked_in
    ClinicEventMailer.registration_confirmed(ClinicEvent.first)
  end
end
