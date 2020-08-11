class ClinicEventMailer < ApplicationMailer
  def registration_confirmed(clinic_event)
    @clinic_event = clinic_event
    I18n.with_locale(locale) do
      mail(to: clinic_event.patient.email,
            subject: t('.subject', date: clinic_event.event_date.strftime("%d/%m/%Y")))
    end
  end
end
