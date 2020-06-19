class AppointmentMailer < ApplicationMailer
  def patient_checked_in(appointment)
    mail(to: appointment.patient.email, subject: "You're Checked In!")
  end
end
