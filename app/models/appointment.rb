class Appointment < ApplicationRecord
  include AASM

  belongs_to :clinic
  belongs_to :patient

  aasm column: :queue_state do
    state :not_checked_in, initial: true
    state :canceled, :checked_in, :invited, :at_clinic, :done

    event :cancel do
      transitions from: [:not_checked_in, :checked_in, :invited], to: :canceled
    end

    event :check_in do
      after do
        AppointmentMailer.patient_checked_in(self).deliver
        # sms_patient_checked_in(self.patient.phone_number)
      end

      transitions from: :not_checked_in, to: :checked_in, if: :clinic_can_check_in?
    end

    event :invite, after: :notify_invitation do
      transitions from: :checked_in, to: :invited, if: :clinic_is_open?
    end

    event :mark_arrived do
      transitions from: :invited, to: :at_clinic
    end

    event :finish do
      transitions from: :at_clinic, to: :done
    end
  end

  def available_event_names
    aasm.events(permitted: true).collect(&:name).collect(&:to_s)
  end

  def clinic_is_open?
    clinic.opened?
  end

  def clinic_can_check_in?
    clinic.can_check_in?
  end

  def notify_invitation
    InviteQueuedPatientJob.perform_later patient
  end

  # TODO: Check if SMS should be sent check patient checked in
  # def sms_patient_checked_in(phone_number)
  #   client = SmsClient.new
  #   to_number = phone_number
  #   to_number = "+14075366339" if Rails.env.development?
  #   client.send_message(
  #     from: ENV['TWILIO_FROM_PHONE'],
  #     to: to_number,
  #     body: "You're Checked In! We will text and/or email you when we're ready for you. Clinic Wizard"
  #   )
  # end
end
