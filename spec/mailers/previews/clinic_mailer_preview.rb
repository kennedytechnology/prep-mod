# Preview all emails at http://localhost:3000/rails/mailers/clinic_mailer
class ClinicMailerPreview < ActionMailer::Preview

  def public_clinic_created
    clinic = Clinic.last
    user = User.last
    ClinicMailer.public_clinic_created(user, clinic) # The instance method works here as a class method
  end

end
