class PatientNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.patient_notifier_mailer.invitation.subject
  #
  def invitation(patient)
    @patient = patient

    I18n.with_locale(locale) do
      mail to: patient.email
    end
  end

  def check_in_reminder
    @appointment = params[:appointment]
    @patient = @appointment.patient

    I18n.with_locale(locale) do
      mail to: @patient.email, subject: t('.subject', date: @appointment.clinic.clinic_date, location: @appointment.clinic.location)
    end
  end

  def kit_created(patient)
    @patient = patient

    I18n.with_locale(locale) do
      mail to: patient.email
    end
  end
end
