class ProviderEnrollmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.provider_enrollment_mailer.request_confirmation.subject
  #
  def request_confirmation(provider_enrollment)
    @greeting = "Hi"
    @provider_enrollment = provider_enrollment

    I18n.with_locale(locale) do
      mail to: provider_enrollment.practice_email
    end
  end

  def acceptance_confirmation(provider_enrollment, temp_password = 1234567890 )
    @greeting = "Hi"
    @provider_enrollment = provider_enrollment
    @temp_password = temp_password

    I18n.with_locale(locale) do
      mail to: provider_enrollment.practice_email
    end
  end

  def email_provider_denial(provider_enrollment)
    @message = ProviderDenialMessage.first

    I18n.with_locale(locale) do
      mail to: provider_enrollment.practice_email
    end
  end

  def need_more_information_email(provider_enrollment)
    @greeting = "Hi"
    @provider_enrollment = provider_enrollment

    I18n.with_locale(locale) do
      mail to: provider_enrollment.practice_email
    end
  end
end
