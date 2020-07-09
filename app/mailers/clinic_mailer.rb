class ClinicMailer < ApplicationMailer
  def public_clinic_created(user, clinic)
    @clinic = clinic
    @user = user
    mail(to: user.email, subject: 'New Public Clinic Created')
  end

  def send_vaccinated_confirmation(clinic_event)
    @clinic_event = clinic_event
    @patient = clinic_event.patient
    mail(to: clinic_event.patient.email, subject: 'Vaccinated confirmation')
  end
end
