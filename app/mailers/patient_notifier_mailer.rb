class PatientNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.patient_notifier_mailer.invitation.subject
  #
  def invitation(patient)
    @patient = patient
    mail to: patient.email, subject: "Your COVID-19 Test Registration Access Code"
  end

  def kit_created(patient)
    @patient = patient
    mail to: patient.email, subject: "Safety Kit Successfully Created"
  end
end
