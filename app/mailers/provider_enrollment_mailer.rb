class ProviderEnrollmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.provider_enrollment_mailer.request_confirmation.subject
  #
  def request_confirmation(provider_enrollment)
    @greeting = "Hi"
    @provider_enrollment = provider_enrollment

    mail to: provider_enrollment.practice_email, subject: "Request confirmation"
  end

  def acceptance_confirmation(provider_enrollment, temp_password = 1234567890 )
    @greeting = "Hi"
    @provider_enrollment = provider_enrollment
    @temp_password = temp_password

    mail to: provider_enrollment.practice_email, subject: "Confirmation for your acceptance"
  end
end
