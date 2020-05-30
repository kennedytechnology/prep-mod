class InviteQueuedPatientJob < ApplicationJob
  queue_as :default
  
  def perform(*patients)
    patients.each do |patient|
      twilio = Twilio::REST::Client.new
      to_number = patient.phone_number
      to_number = "+14075366339" if Rails.env.development?
      twilio.messages.create({
        from: ENV['TWILIO_FROM_PHONE'],
        to: to_number,
        body: "It's your turn! Please proceed to the clinic for your appointment."
      })
    end
  end
end
