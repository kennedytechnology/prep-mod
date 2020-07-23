require "rails_helper"

RSpec.describe ClinicEventMailer, type: :mailer do
  describe "registration_confirmed" do
    let(:clinic_event) { build(:clinic_event) }
    let(:mail) { ClinicEventMailer.registration_confirmed(clinic_event) }

    it "renders the headers" do
      expect(mail.subject).to eq("You are registered for the clinic on #{clinic_event.event_date.strftime("%d/%m/%Y")}")
      expect(mail.to).to eq([clinic_event.patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("#{clinic_event.event_date.strftime("%d/%m/%Y")}")
    end
  end
end
