class Appointment < ApplicationRecord
  include AASM

  belongs_to :clinic, counter_cache: true
  belongs_to :patient

  scope :to_be_reminded, -> {
    start_date = DateTime.now.utc
    end_date = DateTime.now.utc + 3.days
    where(appointment_at: start_date..end_date).where(reminder_sent_at: nil)
  }

  aasm column: :queue_state do
    state :not_checked_in, initial: true
    state :canceled, :checked_in, :invited, :at_clinic, :completed, :pending

    event :cancel do
      transitions from: [:not_checked_in, :checked_in, :invited], to: :canceled
    end

    event :check_in do
      after do
        AppointmentMailer.patient_checked_in(self).deliver
        sms_patient_checked_in(self.patient.phone_number)
      end

      transitions from: :not_checked_in, to: :checked_in, if: :clinic_can_check_in?
    end

    event :invite, after: :notify_invitation do
      after do
        AppointmentMailer.patient_invited(self).deliver
      end

      transitions from: :checked_in, to: :invited, if: :clinic_is_open?
    end

    event :mark_arrived do
      transitions from: :invited, to: :at_clinic, if: :clinic_has_capacity?
    end

    event :finish do
      transitions from: :at_clinic, to: :completed
    end

    event :reinstate do
      transitions from: [:canceled, :pending], to: :checked_in
    end

    event :move_to_pending do
      transitions from: :invited, to: :pending
    end
  end

  def available_event_names
    aasm.events(permitted: true).collect(&:name).collect(&:to_s)
  end

  def clinic_has_capacity?
    clinic.active_queue_patients_count > clinic.appointments.where(queue_state: "at_clinic").count
  end

  def clinic_is_open?
    clinic.opened? || clinic.opened_automation_paused?
  end

  def clinic_can_check_in?
    clinic.can_check_in?
  end

  def notify_invitation
    InviteQueuedPatientJob.perform_later patient
  end

  def sms_patient_checked_in(phone_number)
    client = SmsClient.new
    to_number = phone_number
    to_number = "+14075366339" if Rails.env.development?
    client.send_message(
      from: ENV['TWILIO_FROM_PHONE'],
      to: to_number,
      body: "You're Checked In! We will text and/or email you when we're ready for you. Clinic Wizard"
    )
  end

  def send_sms_reminder(phone_number)
    client = SmsClient.new
    to_number = phone_number
    to_number = "+14075366339" if Rails.env.development?
    client.send_message(
      from: ENV['TWILIO_FROM_PHONE'],
      to: to_number,
      body: "We look forward to seeing you at your upcoming appointment. Instructions on how to check in are sent to your email. Thank you!"
    )
  end
end
