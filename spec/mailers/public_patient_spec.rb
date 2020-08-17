require "rails_helper"

RSpec.describe PublicPatientMailer, type: :mailer do

    describe "request_confirmation" do
      let(:clinic) {create(:clinic)}
      let(:patient) {create(:patient)}
      let(:mail) { PublicPatientMailer.request_confirmation(patient, clinic) }
      before { Appointment.create(clinic_id: clinic.id, patient_id: patient.id, appointment_at: Faker::Date.between(from: 3.days.from_now, to: 30.days.from_now))}

      it "renders the headers" do
        expect(mail.subject).to eq(I18n.t('public_patient_mailer.request_confirmation.subject', name: clinic.services.pluck(:name).join(", ")))
        expect(mail.to).to eq([patient.email])
        expect(mail.from).to eq(["notifications@clinicwizard.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match(patient.first_name[0])
      end
    end
end
