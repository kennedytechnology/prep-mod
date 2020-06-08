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
  
end
