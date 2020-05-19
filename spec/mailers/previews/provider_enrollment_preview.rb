# Preview all emails at http://localhost:3000/rails/mailers/provider_enrollment
class ProviderEnrollmentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/provider_enrollment/request_confirmation
  def request_confirmation
    ProviderEnrollmentMailer.request_confirmation(ProviderEnrollment.last)
  end

end
