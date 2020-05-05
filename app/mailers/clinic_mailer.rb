class ClinicMailer < ApplicationMailer
  def public_clinic_created(user, clinic)
    @clinic = clinic
    @user = user
    mail(to: user.email, subject: 'New Public Clinic Created')
  end
end
