class EmployerMailer < ApplicationMailer
    def request_confirmation(employer)
        @employer = employer
        mail to: employer.email, subject: "Your request to receive COVID-19 information about your constituents or employees has been submitted successfully."
    end
end