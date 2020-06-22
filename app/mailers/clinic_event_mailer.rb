class ClinicEventMailer < ApplicationMailer
  def registration_confirmed(clinic_event)
    @clinic_event = clinic_event
    mail(to: clinic_event.patient.email, 
          subject: "You are registered for the clinic on #{clinic_event.event_date.strftime("%d/%m/%Y")}")
  end
end
