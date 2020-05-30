class RemindQueuedPatientJob < ApplicationJob
  queue_as :default

  def perform(*patients)
    patients.each do |patient|
      twilio = Twilio::REST::Client.new
      to_number = patient.phone_number
      to_number = "+14075366339" if Rails.env.development?
      twilio.messages.create({
        from: ENV['TWILIO_FROM_PHONE'],
        to: to_number,
        body: "You are registered for the clinic #{patient.clinic.clinic_date} at #{patient.clinic.location}. When you arrive, you can check in online at #{ENV['SITE_URL']}/check_in/#{patient.check_in_code}"
      })
    end
  end
end
