class EmployerMailer < ApplicationMailer
    def request_confirmation(employer)
        @employer = employer

        I18n.with_locale(locale) do
            mail to: employer.email
        end
    end
end