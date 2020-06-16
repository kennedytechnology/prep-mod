class EmployerMailer < ApplicationMailer
    def request_confirmation
        @greeting = "Hi"
        @employer = employer

        mail to: employer.email, subject: "Request confirmation"
    end
end