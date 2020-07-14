desc 'Send appointment reminders ...'
task :appointment_reminders do
  start_date = DateTime.now.utc
  end_date = DateTime.now.utc.beginning_of_day + 3.days
  appointments = Appointment.to_be_reminded

  appointments.each do |appointment|
    patient = appointment.patient
    email = patient.email
    phone = patient.phone_number

    if patient.notify_via_email
      #send remidner via email
    elsif patient.notify_via_sms
      #send reminder via sms
    end
    appointment.update(reminder_sent_at: DateTime.now.utc)
  end
end
