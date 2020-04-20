# Preview all emails at http://localhost:3000/rails/mailers/patient_notifier
class PatientNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/patient_notifier/invitation
  def invitation
    PatientNotifierMailer.invitation(Patient.last)
  end

end
