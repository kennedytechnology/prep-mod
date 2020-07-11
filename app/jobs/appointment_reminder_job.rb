class AppointmentReminderJob < ActiveJob::Base
  queue_as :default

  def perform
    Appointment.to_be_reminded.each do |appointment|
      phone = "+1#{patient.phone_number}"

      if patient.notify_via_email
        AppointmentMailer.send_reminder(appointment).deliver_later
      elsif patient.notify_via_sms
        SmsClient.send_message(
          from: ENV['TWILIO_FROM_PHONE'],
          to: phone,
          body: body(appointment)
        )
      end
      appointment.update(reminder_sent_at: DateTime.now.utc)
    end
    AppoinemtnReminderJob.set(wait_until: DateTime.now.utc + 1.hour).perform_later
  end

  private

  def body(appointment)
    "We look forward to seeing you at your upcoming appointment. " +
      "Click here to check in: #{ENV['SITE_URL']}/check_in/#{@appointment.patient.check_in_code}"
  end
end
