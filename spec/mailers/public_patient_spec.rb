require "rails_helper"

RSpec.describe PublicPatientMailer, type: :mailer do

    describe "request_confirmation" do
      let(:clinic) {create(:clinic)}
      let(:patient) {create(:patient)}
      let(:mail) { PublicPatientMailer.request_confirmation(patient, clinic) }
      before { Appointment.create(clinic_id: clinic.id, patient_id: patient.id, appointment_at: Faker::Date.between(from: 3.days.from_now, to: 30.days.from_now))}
  
      it "renders the headers" do
        expect(mail.subject).to eq("Confirmation for your request about COVID-19 testing.")
        expect(mail.to).to eq([patient.email])
        expect(mail.from).to eq(["notifications@clinicwizard.com"])
      end
  
      it "renders the body" do
        expect(mail.body.encoded).to match(patient.full_name)
      end
    end  
end
