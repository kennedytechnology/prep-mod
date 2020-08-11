class AppointmentMailer < ApplicationMailer
  def patient_checked_in(appointment)
    I18n.with_locale(locale) do
      mail(to: appointment.patient.email)
    end
  end

  def send_reminder(appointment)
    @appointment = appointment
    I18n.with_locale(locale) do
      mail(to: appointment.patient.email)
    end
  end

  def patient_invited(appointment)
    I18n.with_locale(locale) do
      mail(to: appointment.patient.email)
    end
  end

  def appointment_canceled(appointment)
    I18n.with_locale(locale) do
      mail(to: appointment.patient.email)
    end
  end
end