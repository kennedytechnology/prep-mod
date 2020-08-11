class ClinicMailer < ApplicationMailer
  def public_clinic_created(user, clinic)
    @clinic = clinic
    @user = user
    I18n.with_locale(locale) do
      mail(to: user.email)
    end
  end

  def send_vaccinated_confirmation(clinic_event)
    @clinic_event = clinic_event
    @patient = clinic_event.patient

    I18n.with_locale(locale) do
      mail(to: clinic_event.patient.email)
    end
  end
end
