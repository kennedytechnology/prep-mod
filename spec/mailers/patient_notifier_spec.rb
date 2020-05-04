require "rails_helper"

RSpec.describe PatientNotifierMailer, type: :mailer do
  describe "invitation" do
    let(:patient) { create(:patient) }
    let(:mail) { PatientNotifierMailer.invitation(patient) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your COVID-19 Test Registration Access Code")
      expect(mail.to).to eq([patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(patient.full_name)
      expect(mail.body.encoded).to match(patient.access_code)
    end
  end

  describe "Kit Created" do
    let(:patient) { create(:patient) }
    let(:mail) { PatientNotifierMailer.kit_created(patient) }

    it "renders the headers" do
      expect(mail.subject).to eq("Safety Kit Successfully Created")
      expect(mail.to).to eq([patient.email])
      expect(mail.from).to eq(["notifications@clinicwizard.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(patient.email)
    end
  end
end
