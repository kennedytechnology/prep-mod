# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def patient_checked_in
    AppointmentMailer.patient_checked_in(Appointment.first)
  end

  def send_reminder
    AppointmentMailer.send_reminder(Appointment.first)
  end
end
