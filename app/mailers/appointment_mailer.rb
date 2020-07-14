class AppointmentMailer < ApplicationMailer
  def patient_checked_in(appointment)
    mail(to: appointment.patient.email, subject: "You're Checked In!")
  end

  def send_reminder(appointment)
    @appointment = appointment
    mail(to: appointment.patient.email, subject: "Upcoming appointment reminder")
  end

  def patient_invited(appointment)
    mail(to: appointment.patient.email, subject: "You're Invited!")
  end

  def appointment_canceled(appointment)
    mail(to: appointment.patient.email, subject: "Your appointment is canceled")
  end
end