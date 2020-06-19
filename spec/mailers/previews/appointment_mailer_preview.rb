# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def request_confirmation
    AppointmentMailer.patient_checked_in(Appointment.first)
  end
end
