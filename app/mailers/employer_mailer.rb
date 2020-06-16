class EmployerMailer < ApplicationMailer
    def request_confirmation(employer)
        @employer = employer
        mail to: employer.email, subject: "Confirmation for your request to access information about your workplace"
    end
end