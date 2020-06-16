# Preview all emails at http://localhost:3000/rails/mailers/employer_mailer
class EmployerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employer/request_confirmation
  def request_confirmation
    EmployerMailer.request_confirmation(Employer.last)
  end

end